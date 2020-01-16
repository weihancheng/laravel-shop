<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class OrderRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'address_id' => [
            	'required',
				Rule::exists('user_addresses', 'id')->where('user_id', $this->user()->id)
			],
        ];
    }
}
