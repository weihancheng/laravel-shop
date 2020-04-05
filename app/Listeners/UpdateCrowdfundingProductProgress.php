<?php

namespace App\Listeners;

use App\Events\OrderPaid;
use App\Models\Order;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class UpdateCrowdfundingProductProgress implements ShouldQueue
{
    public function handle(OrderPaid $event)
    {
        $order = $event->getOrder();
        // 如果订单不是众筹商品则无需处理
        if ($order->type !== Order::TYPE_CROWDFUNDING) {
            return;
        }

        $crowdfunding = $order->items[0]->product->crowdfunding;
        $data = Order::query()
            ->where('type', Order::TYPE_CROWDFUNDING)
            ->whereNotNull('paid_at')
            ->whereHas('items', function ($query) use ($crowdfunding) {
                $query->where('product_id', $crowdfunding->product_id);
            })->first([
                // 取出订单总金额
                \DB::raw('sum(total_amount) as total_amount'),
                \DB::raw('count(distinct(user_id) as user_count')
            ]);
        $crowdfunding->update([
           'total_amount' => $data->total_amount,
           'user_count' => $data->user_count
        ]);
    }
}
