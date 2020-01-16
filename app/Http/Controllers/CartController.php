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
		return view('cart.index', compact('cartItems'));
    }

    // 移除商品
	public function remove(ProductSku $sku, Request $request)
	{
		$request->user()->cartItems()->where('product_sku_id', $sku->id)->delete();
		return [];
    }
}
