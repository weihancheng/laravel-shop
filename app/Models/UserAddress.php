<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    protected $fillable = [
		'province',
		'city',
		'district',
		'address',
		'zip',
		'contact_name',
		'contact_phone',
		'last_used_at',
	];

    protected $dates = ['last_used_at'];

    protected $appends = [
        'full_address'
    ];

	public function user()
	{
		return $this->belongsTo(User::class);
    }

    // 获取完整地址属性 (这里创建一个访问器: https://learnku.com/docs/laravel/6.x/eloquent-mutators/5179#defining-an-accessor)
	public function getFullAddressAttribute()
	{
		return "{$this->province}{$this->city}{$this->district}{$this->address}";
    }
}
