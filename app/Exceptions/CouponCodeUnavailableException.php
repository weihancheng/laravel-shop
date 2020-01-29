<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Http\Request;
use Throwable;

class CouponCodeUnavailableException extends Exception
{
    public function __construct($message, int $code = 403)
    {
        parent::__construct($message, $code);
    }

    public function render(Request $request)
    {
        // 如果用户通过api请求,就放回json格式
        if ($request->exceptsJson()) {
            return response()->json(['msg' => $this->message], $this->code);
        }

        // 否者放回上一页并带上错误信息
        return redirect()->back()->withErrors(['coupon_code' => $this->message]);
    }
}
