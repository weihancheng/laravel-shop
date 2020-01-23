<?php

namespace App\Http\Requests;


use App\Models\Order;

class HandleRefundRequest extends Request
{

    public function rules()
    {
        return [
            'agree' => ['required', 'boolean'],
            'reason' => ['required_if:agree,false'] //拒绝退款时,需要输入拒绝理由
        ];
    }
}
