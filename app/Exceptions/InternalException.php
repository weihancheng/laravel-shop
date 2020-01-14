<?php

namespace App\Exceptions;

use App\Http\Requests\Request;
use Exception;
use Throwable;

// 内部异常类
class InternalException extends Exception
{
    protected $msgForUser;

    public function __construct(string $message, string $msgForUser = '系统内部错误', int $code = 500) {
        parent::__construct($message, $code);
        $this->msgForUser = $msgForUser;
    }

    public function render(Request $request) {
        if ($request->expectsJson()) {
            return response()->json(['msg' => $this->msgForUser], $this->code);
        }

        return view('pages.errors', ['msg' => $this->msgForUser]);
    }
}
