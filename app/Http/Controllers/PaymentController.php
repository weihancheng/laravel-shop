<?php

namespace App\Http\Controllers;

use App\Events\OrderPaid;
use App\Exceptions\InvalidRequestException;
use App\Models\Order;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    // 调用支付宝支付
    public function payByAlipay(Order $order, Request $request)
    {
        // 判断是否是当前用户
        $this->authorize('own', $order);
        // 订单已支付或已关闭
        if ($order->paid_at || $order->closed) throw new InvalidRequestException('订单状态不正确');

        // 调用支付宝
        return app('alipay')->web([
            'out_trade_no' => $order->no,   //订单编号, 需要保证商户端不重复,
            'total_amount' => $order->total_amount,  // 订单总金额
            'subject' => '支付 Lavavel Shop的订单:' . $order->no // 订单标题
        ]);
    }

    // 前端回调
    public function alipayReturn()
    {
        // 验证提交的参数是否合法
        try {
            app('alipay')->verify();
        } catch (\Exception $e) {
            return view('pages.errors', ['msg' => '数据不正确']);
        }
        return view('pages.success', ['msg' => '付款成功']);
    }

    // 支付宝服务器回调
    public function alipayNotify()
    {
        // 校验输入参数
        $data = app('alipay')->verify();
        // 如果订单不是成功或者结束,则不会走后续流程
        // 所有交易状态 https://docs.open.alipay.com/59/103672
        if (!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_CLOSED'])) return app('alipay')->success();

        // $data->out_trade_no 拿到流水单号,并在数据库中查询
        $order = Order::query()->where('no', $data->out_trade_no)->first();
        // 不太可能支付了一笔不存在的订单, 这个判断只是加强系统的健壮性
        if (!$order) return 'fail';
        // 如果这笔订单状态已经是已支付
        if ($order->paid_at) return app('alipay')->success();

        $order->update([
            'paid_at' => Carbon::now(),
            'payment_method' => 'alipay',
            'payment_no' => $data->trade_no // 支付宝订单单号
        ]);
        // 调用支付成功的事件
        $this->afterPaid($order);
        return app('alipay')->success();
    }

    // 调用微信支付
    public function payByWechat(Order $order, Request $request)
    {
        // 校验权限
        $this->authorize('own', $order);
        // 订单状态已支付或已关闭
        if ($order->paid_at || $order->closed) throw new InvalidRequestException('订单状态不正确');

        // 微信返回的json
        $wechatOrder = app('wechat_pay')->scan([
            'out_trade_no' => $order->no,
            'total_fee' => $order->total_amount * 100, // 与支付宝不同, 微信支付金额单位为分
            'body' => '支付 Laravel Shop 的订单：'.$order->no, // 订单描述
        ]);

        // 把要转化的字符串作为qrcode的构造函数
        $qrcode = new QrCode($wechatOrder->code_url);

        // 将生成的二维码图片数据以字符串的形式输出, 并带上相应的响应类型
        return response($qrcode->writeString(), 200, ['Content-type' => $qrcode->getContentType()]);

    }

    // 微信支付服务端回调
    public function wechatNotify()
    {
        // 校验参数
        $data = app('wechat_pay')->verify();
        $order = Order::query()->where('no', $data->out_trade_no)->first();
        // 订单不存在则告知微信支付
        if (!$order) return 'fail';
        // 订单支付成功
        if ($order->paid_at) return app('wechat_pay')->success();

        // 订单标记为已支付
        $order->update([
            'paid_at' => Carbon::now(),
            'payment_method' => 'wechat',
            'payment_no' => $data->transaction_id
        ]);
        // 调用支付成功后的事件
        $this->afterPaid($order);
        return app('wechat_pay')->success();
    }

    public function afterPaid(Order $order)
    {
        event(new OrderPaid($order));
    }

}
