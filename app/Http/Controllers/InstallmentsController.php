<?php

namespace App\Http\Controllers;

use App\Events\OrderPaid;
use App\Exceptions\InvalidRequestException;
use App\Models\Installment;
use App\Models\InstallmentItem;
use App\Models\Order;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class InstallmentsController extends Controller
{
    // 显示分期付款列表
    public function index(Request $request)
    {
        $installments = Installment::query()
            ->where('user_id', $request->user()->id)
            ->paginate(10);

        return view('installments.index', compact('installments'));
    }

    // 分期付款详情页
    public function show(Installment $installment)
    {
        $this->authorize('own', $installment);
        // 取出所有还款计划, 并按照顺序进行排列
        $items = $installment->items()->orderBy('sequence')->get();
        // 下一个还款计划
        $nextItem = $items->where('paid_at', null)->first();

        return view('installments.show', compact('installment', 'items', 'nextItem'));
    }

    public function payByAlipay(Installment $installment)
    {
        if ($installment->order->closed) {
            throw new InvalidRequestException('对应的商品订单已被关闭');
        }

        if ($installment->status === Installment::STATUS_FINISHED) {
            throw new InvalidRequestException('该订单的分期付款已经还清');
        }

        if (!$nextItem = $installment->items()->whereNull('paid_at')->orderBy('sequence')->first()) {
            throw new InvalidRequestException('该分期订单已结清');
        }

        // 调用支付宝的网页支付
        /*
         * app('alipay')->web() 方法的参数中传入 notify_url 和 return_url
         * 来覆盖掉之前在 AppServiceProvider::register() 方法中初始化支付宝支付实例时设置的前后端回调地址。
         */
        return app('alipay')->web([
            'out_trade_no' => $installment->no . '_' . $nextItem->sequence,
            'total_amount' => $nextItem->total,
            'subject' => '支付 Laravel Shop 的分期订单:' . $installment->no,
            // 这里的notify_url 和 return_url 可以覆盖在AppServiceProvider 设置的回调地址
            'notify_url' => ngrok_url('installments.alipay.notify'),
            'retrun_url' => ngrok_url('installments.alipay.return')
        ]);

    }

    public function alipayReturn()
    {
        try {
            app('alipay')->verify();
        } catch (\Exception $e) {
            return view('pages.errors', ['msg' => '数据不正确']);
        }

        return view('pages.success', ['msg' => '付款成功']);
    }

    public function alipayNotify()
    {
        // 校验支付宝回调参数是否正确
        $data = app('alipay')->verify();
        // 如果订单状态不是成功或者结束, 则不走后续逻辑
        if (!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_FINISHED'])) {
            return app('alipay')->success();
        }

        if ($this->paid($data->out_trade_no, 'alipay', $data->trade_no)) {
            return app('alipay')->success();
        }

        return 'fail';
    }

    public function wechatNotify()
    {
        $data = app('wechat_pay')->verify();
        if ($this->paid($data->out_trade_no, 'wechat', $data->transaction_id)) {
            return app('wechat_pay')->success();
        }

        return 'fail';
    }

    protected function paid($outTradeNo, $paymentMethod, $paymentNo)
    {
        // 拉起支付时使用的支付订单号是由分期流水号 + 还款计划编号组成的
        // 因此可以通过支付宝订单号来还原出这笔还款是哪个分期付款的哪个还款计划
        list($no, $sequence) = explode('_', $outTradeNo);
        // 根据分期流水号查询对应的分期记录, 原则上不会找不到, 这里判断只是增强代码健壮性
        if (!$installment = Installment::where('no', $no)->first()) {
            return false;
        }

        if (!$item = $installment->items()->where('sequence', $sequence)->first()) {
            return false;
        }

        // 如果这个还款计划的支付状态是已支付, 则告知支付宝此订单已完成, 并不执行后续逻辑
        if ($item->paid_at) {
            return true;
        }

        // 使用事务,保证数据一致性
        \DB::transaction(function () use ($paymentNo, $paymentMethod, $no, $installment, $item) {
            // 更新对应的还款计划
            $item->update([
                'paid_at' => Carbon::now(), //支付时间
                'payment_method' => $paymentMethod, // 支付方式
                'payment_no' => $paymentNo, //支付宝订单号
            ]);

            // 如果这是第一笔还款
            if ($item->sequence === 0) {
                // 将分期付款的状态改为还款中
                $installment->update([
                    'status' => Installment::STATUS_REPAYING
                ]);
                // 将对应的订单改为已支付
                $installment->order->update([
                   'paid_at' => Carbon::now(),
                   'payment_method' => 'installment',  // 支付方式为分期付款
                   'payment_no' => $no, // 支付宝订单号为分期付款流水号
                ]);
                // 触发商品订单已支付的事件
                event(new OrderPaid($installment->order));
            }

            // 如果这是最后一笔还款
            if ($item->sequence === $installment->count - 1) {
                // 将分期付款状态改为已结清
                $installment->update(['status' => Installment::STATUS_FINISHED]);
            }
        });

        return true;
    }

    public function payByWechat(Installment $installment)
    {
        if ($installment->order->closed) {
            throw new InvalidRequestException('对应的商品订单已被关闭');
        }

        if ($installment->status === Installment::STATUS_FINISHED) {
            throw new InvalidRequestException('该分期付款已结清');
        }

        if (!$nextItem = Installment::query()->items()->whereNull('paid_at')->orderBy('sequence')->first()) {
            throw new InvalidRequestException('该分期付款已结清');
        }

        $wechatOrder = app('wechat_pay')->scan([
           'out_trade_no' => $installment->no . '_' . $nextItem->sequence,
            'total_fee' => $nextItem->total * 100,
            'body' => '支付 Laravel Shop的分期订单:' . $installment->no,
            'notify_url' => ngrok_url('installments.wechat.notify')
        ]);

        // 把要转换的字符串作为Qrcode的构造函数参数
        $qrCode = new QrCode($wechatOrder);

        // 将生成的二维码图片数据以字符串形式输出, 并带上相应的响应类型
        return response($qrCode->writeString(), 200, ['Content-type' => $qrCode->getContentType()]);
    }

    public function wechatRefundNotify(Request $request)
    {
        // 给微信的失败响应
        $failXml = '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[FAIL]]></return_msg></xml>';
        // 校验微信回调参数
        $data = app('wechat_pay')->verify(null, true);
        // 根据单号拆解出对应的商品退款单号及对应的还款计划序号
        list($no, $sequence) = explode('_', $data['out_refund_no']);

        $item = InstallmentItem::query()
            ->whereHas('installment', function ($query) use ($no) {
                $query->whereHas('order', function ($query) use ($no) {
                    $query->where('refund_no', $no); // 根据订单表的退款流水号找到对应还款计划
                });
            })
            ->where('sequence', $sequence)
            ->first();

        // 没有找到对应的订单，原则上不可能发生，保证代码健壮性
        if (!$item) {
            return $failXml;
        }

        // 如果退款成功
        if ($data['refund_status'] === 'SUCCESS') {
            // 将还款计划退款状态改成退款成功
            $item->update([
                'refund_status' => InstallmentItem::REFUND_STATUS_SUCCESS,
            ]);
            // 设定一个标志位
            $item->installment->refreshRefundStatus();
        } else {
            // 否则将对应还款计划的退款状态改为退款失败
            $item->update([
                'refund_status' => InstallmentItem::REFUND_STATUS_FAILED,
            ]);
        }

        return app('wechat_pay')->success();
    }
}
