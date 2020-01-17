<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Http\Requests\OrderRequest;
use App\Services\CartService;
use App\Services\OrderService;
use Illuminate\Http\Request;
use App\Jobs\CloseOrder;
use App\Models\Order;
use App\Models\ProductSku;
use App\Models\UserAddress;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class OrdersController extends Controller
{
	public function store(OrderRequest $request, OrderService $orderService)
	{
		$user = $request->user();
		$address = UserAddress::find($request->input('address_id'));
		return $orderService->store($user, $address, $request->input('remark'), $request->input('items'));
	}

	// 订单列表页
	public function index(Request $request)
	{
		$orders = Order::query()
			->with(['items.product', 'items.productSku'])
			->where('user_id', $request->user()->id)
			->orderBy('created_at', 'desc')
			->paginate();
		return view('orders.index', compact('orders'));
	}

	public function show(Order $order, Request $request)
	{
		$this->authorize('own', $order);
		/**
		 * 这里的 load() 方法与上一章节介绍的 with() 预加载方法有些类似，
		 * 称为 延迟预加载，不同点在于 load() 是在已经查询出来的模型上调用，
		 * 而 with() 则是在 ORM 查询构造器上调用。
		 */
		return view('orders.show', ['order' => $order->load(['items.productSku', 'items.product'])]);
	}
}
