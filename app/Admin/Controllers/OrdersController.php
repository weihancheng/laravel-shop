<?php

namespace App\Admin\Controllers;

use App\Exceptions\InternalException;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\HandleRefundRequest;
use App\Models\CrowdfundingProduct;
use App\Models\Order;
use App\Services\OrderService;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\Request;

class OrdersController extends AdminController
{
    use ValidatesRequests;

    protected $title = '订单';

    // index页
    protected function grid()
    {
        $grid = new Grid(new Order);

        // 获取paid_at不为空的数据
        $grid->model()->whereNotNull('paid_at')->orderBy('paid_at', 'desc');

        $grid->no('订单流水号');
        // 展示关联关系的数据是使用column
        $grid->column('user.name', '买家');
        $grid->total_amount('总金额')->sortable();
        $grid->paid_at('支付时间')->sortable();
        $grid->ship_status('物流')->display(function ($value) {
            return Order::$shipStatusMap[$value];
        });
        $grid->refund_status('退款状态')->display(function ($value) {
            return Order::$refundStatusMap[$value];
        });
        // 禁用创建订单按钮
        $grid->disableCreateButton();
        $grid->actions(function ($actions) {
            // 禁用删除和编辑按钮
            $actions->disableDelete();
            $actions->disableEdit();
        });
        $grid->tools(function ($tools) {
            // 禁用批量删除按钮
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });
        return $grid;
    }

    // 商品详情
    public function show($id, Content $content)
    {
        return $content->header('查看订单')
            ->body(view('admin.orders.show', ['order' => Order::find($id)]));
    }

    // 发货
    public function ship(Order $order, Request $request)
    {
        // 判断当前的订单是否已支付
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未付款');
        }
        // 判断当前订单发货状态是否为未发货
        if ($order->ship_status !== Order::SHIP_STATUS_PENDING) {
            throw new InvalidRequestException('该订单已发货');
        }

        // 众筹订单只有在众筹成功之后才能发货
        if ($order->type === Order::TYPE_CROWDFUNDING &&
            $order->items[0]->product->crowdfunding->status !== CrowdfundingProduct::STATUS_SUCCESS) {
            throw new InvalidRequestException('众筹订单只能在众筹成功后发货');
        }

        $data = $this->validate($request, [
            'express_company' => ['required'],
            'express_no' => ['required']
        ], [], [
            'express_company' => '物流公司',
            'express_no' => '物流编号',
        ]);

        // 将订单发货状态改为已发货, 并存入物流信息
        $order->update([
            'ship_status' => Order::SHIP_STATUS_DELIVERED,
            // 我们在 Order模型的$cart中指明了 ship_data 是一个数组
            'ship_data' => $data
        ]);

        // 返回上一页
        return redirect()->back();
    }

    public function handleRefund(Order $order, HandleRefundRequest $request, OrderService $orderService)
    {
        // 判断订单状态是否正确
        if ($order->refund_status !== Order::REFUND_STATUS_APPLIED) throw new InvalidRequestException('订单状态不正确');

        // 是否同意退款
        if ($request->input('agree')) {
            // 后台管理员同意退款
            $extra = $order->extra ?: [];
            unset($extra['refund_disagree_reason']);
            $order->update([
                'extra' => $extra
            ]);

            // 调用退款逻辑
            $orderService->refundOrder($order);
        } else {
            // 将拒绝退款理由放到订单的extra字段中
            $extra = $order->extra ?: [];
            $extra['refund_disagree_reason'] = $request->input('reason');
            // 将订单的退款状态改为未退款
            $order->update([
                'refund_status' => Order::REFUND_STATUS_PENDING,
                'extra' => $extra
            ]);
        }
        return $order;
    }
}
