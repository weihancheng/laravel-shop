<?php
namespace App\Services;

use App\Models\CartItem;
use Auth;

class CartService {
	public function get()
	{
		return Auth::user()->cartItems()->with(['productSku.product'])->get();
	}

	public function add($skuId, $amount)
	{
		$user = Auth::user();
		// 查询数据库该商品是否已经在购物车里
		if ($cart = $user->cartItems()->where('product_sku_id', $skuId)->first()) {
			// 如果存在就直接叠加商品数量
			$cart->update(['amount' => $cart->amount + $amount]);
		} else {
			// 这里不太懂
			$cart = new CartItem(['amount' => $amount]);
			$cart->user()->associate($user);
			$cart->productSku()->associate($skuId);
			$cart->save();
		}
		return [];
	}

	public function remove($skuIds)
	{
		// 可以传单个ID , 也可以传ID数组
		if (!is_array($skuIds)) {
			$skuIds = [$skuIds];
		}
		Auth::user()->cartItems()->whereIn('product_sku_id', $skuIds)->delete();
	}
}
