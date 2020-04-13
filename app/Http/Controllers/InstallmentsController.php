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
}
