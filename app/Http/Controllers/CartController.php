<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCartRequest;
use App\Models\CartItem;
use App\Models\ProductSku;
use App\Services\CartService;
use Illuminate\Http\Request;

class CartController extends Controller
{
	protected $cartService;

	// 利用 Laravel 的自动解析功能注入 CartService 类
	public function __construct(CartService $cartService)
	{
		$this->cartService = $cartService;
	}

	public function add(AddCartRequest $request) {
        $this->cartService->add($request->input('sku_id'), $request->input('amount'));
        return [];
    }

    // 购物车列表
	public function index(Request $request)
	{
		$cartItems = $this->cartService->get();
		// 通常来说用户重复使用最近用过的地址概率比较大，因此我们在取地址的时候根据 last_used_at 最后一次使用时间倒序排序，这样用户体验会好一些。
		$addresses = $request->user()->addresses()->orderBy('last_used_at', 'desc')->get();
		return view('cart.index', compact('cartItems', 'addresses'));
    }

    // 移除商品
	public function remove(ProductSku $sku, Request $request)
	{
		$this->cartService->remove($sku->id);
		return [];
    }
}
