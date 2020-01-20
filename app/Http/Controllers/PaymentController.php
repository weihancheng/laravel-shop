<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
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
        return app('alipay')->success();
    }
}
