<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class Order extends Model
{
    const REFUND_STATUS_PENDING = 'pending';    // pending: 等待, refund: 退款
    const REFUND_STATUS_APPLIED = 'applied';    // applied: 申请,请求
    const REFUND_STATUS_PROCESSING = 'processing'; // processing: 处理中
    const REFUND_STATUS_SUCCESS = 'success'; // 成功的
    const REFUND_STATUS_FAILED = 'failed'; // 失败的

    const SHIP_STATUS_PENDING = 'pending';  // ship: 运送, pending: 等待
    const SHIP_STATUS_DELIVERED = 'delivered'; // delivered: 运输
    const SHIP_STATUS_RECEIVED = 'received';  // received: 收到

	public static $refundStatusMap = [
		self::REFUND_STATUS_PENDING => '未退款',
		self::REFUND_STATUS_APPLIED => '已申请退款',
		self::REFUND_STATUS_PROCESSING => '退款中',
		self::REFUND_STATUS_SUCCESS => '退款成功',
		self::REFUND_STATUS_FAILED => '退款失败',
	];

	public static $shipStatusMap = [
		self::SHIP_STATUS_PENDING   => '未发货',
		self::SHIP_STATUS_DELIVERED => '已发货',
		self::SHIP_STATUS_RECEIVED  => '已收货',
	];

	const TYPE_NORMAL = 'normal';
	const TYPE_CROWDFUNDING = 'crowdfunding';

	public static $typeMap = [
	    self::TYPE_NORMAL => '普通订单',
        self::TYPE_CROWDFUNDING => '众筹订单'
    ];

	protected $casts = [
		'closed' => 'boolean',
		'reviewed' => 'boolean',
		'address' => 'json',
		'ship_data' => 'json',
		'extra' => 'json',
	];

	protected $dates = [
		'paid_at'
	];

	protected $fillable = [
	    'type',
		'no',
		'address',
		'total_amount',
		'remark',
		'paid_at',
		'payment_method',
		'payment_no',
		'refund_status',
		'refund_no',
		'reviewed',
		'ship_status',
		'ship_data',
		'extra'
	];

	protected static function boot()
	{
		parent::boot();
		// 监听模型创建事件, 在写入数据库前触发
		static::creating(function ($model) {
			// 如果模型的 no 指端为空
			if (!$model->no) {
				// 调用 findAvailableNo
				$model->no = static::findAvailableNo();
				// 如果生成失败,则终止创建订单
				if (!$model->no) {
					return false;
				}
			}
		});
	}

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function items()
	{
		return $this->hasMany(OrderItem::class);
	}

    public function couponCode()
    {
        return $this->belongsTo(CouponCode::class);
	}

	public static function findAvailableNo()
	{
		// 订单流水号前缀
		$prefix = date('YmdHis');
		for ($i = 0; $i < 10; $i ++) {
			// 随机生成 6位数字
			$no = $prefix . str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
			// 判断是否已经存在
			if (!static::query()->where('no', $no)->exists()) {
				return $no;
			}
		}
		\Log::warning('find order no failed');
		return false;
	}

	// 生成退货单号
    public static function getAvailableRefundNo()
    {
        do {
            $no = Uuid::uuid4()->getHex(); // 生成大概率不重复的字符串
        } while (self::query()->where('refund_no', $no)->exists()); //避免重复订单号出现

        return $no;
    }
}
