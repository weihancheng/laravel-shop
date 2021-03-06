<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Moontoast\Math\BigNumber;

class InstallmentItem extends Model
{
    protected $fillable = [
        'sequence',
        'base',
        'fee',
        'fine',
        'due_date',
        'paid_at',
        'payment_method',
        'payment_no',
        'refund_status'
    ];

    const REFUND_STATUS_PENDING = 'pending';
    const REFUND_STATUS_PROCESSING = 'processing';
    const REFUND_STATUS_SUCCESS = 'success';
    const REFUND_STATUS_FAILED = 'failed';

    public static $refundStatusMap = [
        self::REFUND_STATUS_PENDING => '为退款',
        self::REFUND_STATUS_PROCESSING => '退款中',
        self::REFUND_STATUS_SUCCESS => '退款成功',
        self::REFUND_STATUS_FAILED => '退款失败',
    ];

    protected $dates = [
        'due_date',
        'paid_at'
    ];

    public function installment()
    {
        return $this->belongsTo(Installment::class);
    }

    public function getTotalAttribute()
    {
        // 小数点计算需要用 bcmath 扩展提供的函数
        $total = big_number($this->base)->add($this->fee);
        if (!is_null($this->fine)) {
            $total = $total->add($this->fine);
        }
        return $total->getValue();
    }

    public function getIsOverdueAttribute()
    {
        return Carbon::now()->gt($this->due_date);
    }
}
