<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCartRequest;
use App\Models\CartItem;
use App\Models\ProductSku;
use Illuminate\Http\Request;

class CartController extends Controller
{

    public function add(AddCartRequest $request) {
        $user = $request->user();
        $skuId = $request->input('sku_id');
        $amount = $request->input('amount');

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

    // 购物车列表
	public function index(Request $request)
	{
		$cartItems = $request->user()->cartItems()->with(['productSku.product'])->get();
		// 通常来说用户重复使用最近用过的地址概率比较大，因此我们在取地址的时候根据 last_used_at 最后一次使用时间倒序排序，这样用户体验会好一些。
		$addresses = $request->user()->addresses()->orderBy('last_used_at', 'desc')->get();
		return view('cart.index', compact('cartItems', 'addresses'));
    }

    // 移除商品
	public function remove(ProductSku $sku, Request $request)
	{
		$request->user()->cartItems()->where('product_sku_id', $sku->id)->delete();
		return [];
    }
}
