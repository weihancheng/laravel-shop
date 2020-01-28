<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCouponCodesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coupon_codes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');  // 优惠价标题
            $table->string('code')->unique();  // 优惠码
            $table->string('type');  // 优惠类型
            $table->decimal('value'); // 折扣值
            $table->unsignedInteger('total'); // 全站可兑换数量
            $table->unsignedInteger('used')->default(0); // 当前兑换数量
            $table->decimal('min_amount', 10, 2); // 使用该优惠劵的最低订单金额
            $table->datetime('not_before')->nullable(); // 在这个时间前不可用
            $table->datetime('not_after')->nullable();  // 在这个时间后不可用
            $table->boolean('enabled');  // 优惠劵是否生效
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('coupon_codes');
    }
}
