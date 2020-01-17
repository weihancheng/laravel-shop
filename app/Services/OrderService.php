<?php
namespace App\Services;

use App\Exceptions\InvalidRequestException;
use App\Jobs\CloseOrder;
use App\Models\Order;
use App\Models\ProductSku;
use App\Models\User;
use App\Models\UserAddress;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class OrderService {

	public function store(User $user, UserAddress $address, $remark, $items)
	{
		// 开启一个数据库事务
		$order = DB::transaction(function () use ($user, $address, $remark, $items) {
			// 更新此地址的最后使用时间
			$address->update(['last_used_at' => Carbon::now()]);
			// 创建一个订单
			$order = new Order([
				'address' => [
					'address' => $address->full_address,
					'zip' => $address->zip,
					'contact_name' => $address->contact_name,
					'contact_phone' => $address->contact_phone
				],
				'remark' => $remark,
				'total_amount' => 0
			]);
			// 订单关联当前用户
			$order->user()->associate($user);
			$order->save();

			$totalAmount = 0;
			// 遍历用户提交的SKU
			foreach ($items as $data) {
				$sku = ProductSku::find($data['sku_id']);
				// 创建一个OrderItem 并直接与当前订单关联(https://learnku.com/courses/laravel-shop/6.x/shopping-cart-under-a-single-page/5646)
				$items = $order->items()->make([
					'amount' => $data['amount'],
					'price' => $sku->price,
				]);
				$items->product()->associate($sku->product_id);
				$items->productSku()->associate($sku);
				$items->save();
				$totalAmount += $sku->price * $data['amount'];
				if ($sku->decreaseStock($data['amount']) <= 0) {
					throw new InvalidRequestException('该商品库存不足');
				}
			}

			// 更新订单总金额
			$order->update(['total_amount' => $totalAmount]);

			// 将下单的商品从购物车中移除
			$skuIds = collect($items)->pluck('sku_id')->all();
			app(CartService::class)->remove($skuIds);
			return $order;

		});
		dispatch(new CloseOrder($order, config('app.order_ttl')));
		return $order;
	}
}
