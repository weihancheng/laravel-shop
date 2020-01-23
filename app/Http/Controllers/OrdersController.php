<?php

namespace App\Http\Controllers;

use App\Events\OrderReviewed;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\OrderRequest;
use App\Http\Requests\SendReviewRequest;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\UserAddress;

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

    // 确认收货
    public function received(Order $order, Request $request)
    {
        // 权限校验
        $this->authorize('own', $order);

        // 判断订单的发货
        if ($order->ship_status != Order::SHIP_STATUS_DELIVERED) {
            throw new InvalidRequestException('发货状态不正确');
        }

        // 更新发货状态
        $order->update([
            'ship_status' => Order::SHIP_STATUS_RECEIVED
        ]);

        // 返回原来页面
        return redirect()->back();
    }

    // 评论界面
    public function review(Order $order)
    {
        $this->authorize('own', $order);

        if (!$order->paid_at) throw new InvalidRequestException('该订单未支付,不可评论');

        return view('orders.review', ['order' => $order->load('items.productSku', 'items.product')]);
    }

    // 发送评论
    public function sendReview(Order $order, SendReviewRequest $request)
    {
        $this->authorize('own', $order);
        // 未支付不能评论
        if (!$order->paid_at) throw new InvalidRequestException('该订单未支付,不可评论');
        // 判断是否已经评论过了
        if ($order->reviewed) throw new InvalidRequestException('该订单已经评论过来,不可重复评论');

        $reviews = $request->input('reviews');
        // 开启事务
        \DB::transaction(function () use ($reviews, $order) {
            // 遍历用户的评论数据
            foreach ($reviews as $review) {
                $orderItem = $order->items()->find($review['id']);
                // 保存评分
                $orderItem->update([
                    'rating' => $review['rating'],
                    'review' => $review['review'],
                    'reviewed_at' => Carbon::now()
                ]);
            }
            // 将评分标记改为已评论
            $order->update(['reviewed' => true]);
            event(new OrderReviewed($order));
        });
        return redirect()->back();
    }
}
