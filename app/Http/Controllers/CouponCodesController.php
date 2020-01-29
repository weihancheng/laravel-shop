<?php

namespace App\Http\Controllers;

use App\Models\CouponCode;
use Carbon\Carbon;

class CouponCodesController extends Controller
{
    public function show($code)
    {
        // 判断优惠劵是否存在
        if (!$record = CouponCode::where('code', $code)->first()) abort(404);

        // 如果优惠劵没有启用, 等于优惠劵不存在
        if (!$record->enabled) abort(404);

        if ($record->total - $record->used <= 0) return response()->json(['msg' => '该优惠劵已被兑换完'], 403);

        if ($record->not_before && $record->not_before->gt(Carbon::now())) return response()->json(['msg' => '该优惠劵现在还不能使用'], 403);

        if ($record->not_after && $record->not_after->lt(Carbon::now())) return response()->json(['msg' => '该优惠劵已过期'], 403);

        return $record;
    }
}
