<?php

namespace App\Http\Controllers;

use App\Models\Installment;
use Illuminate\Http\Request;

class InstallmentsController extends Controller
{
    // 显示分期付款列表
    public function index(Request $request)
    {
        $installments = Installment::query()
            ->where('user_id', $request->user()->id)
            ->where('status', Installment::STATUS_PENDING)
            ->paginate(10);

        return view('installments.index', compact('installments'));
    }

    // 分期付款详情页
    public function show(Installment $installment)
    {
        $this->authorize('own', $installment);
        // 取出所有还款计划, 并按照顺序进行排列
        $items = $installment->items()->orderBy('sequence')->get();
        // 下一个还款计划
        $nextItem = $items->where('paid_at', null)->first();

        return view('installments.show', compact('installment', 'items', 'nextItem'));
    }
}
