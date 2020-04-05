<?php
namespace App\Http\Requests;

use App\Models\ProductSku;
use App\Models\Product;
use Illuminate\Validation\Rule;
use App\Models\CrowdfundingProduct;
class CrowdFundingOrderRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'sku_id' => [
                'required',
                function ($attribute, $value, $fail) {
                    if (!$sku = ProductSku::find($value)) {
                        return $fail('该商品不存在');
                    }
                    // 众筹下单接口仅仅接受支持众筹商品的sku
                    if ($sku->product->type !== Product::TYPE_CROWDFUNDING) {
                        return $fail('该商品不支持众筹');
                    }
                    if (!$sku->product->on_sale) {
                        return $fail('该商品未上架');
                    }
                    // 还要判断众筹商品本身的状态
                    if ($sku->product->crowdfunding->status !== CrowdfundingProduct::STATUS_FUNDING) {
                        return $fail('该商品众筹已结束');
                    }
                    if ($sku->stock === 0) {
                        return $fail('该商品已售完');
                    }
                    if ($this->input('amount') > 0 && $sku->stock < $this->input('amount')) {
                        return $fail('该商品库存不足');
                    }
                }
            ],
            'amount' => ['required', 'integer', 'min:1'],
            'address_id' => [
                'required',
                Rule::exists('user_addresses', 'id')->where('user_id', $this->user()->id)
            ]
        ];
    }
}
