<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_addresses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');  // 等同于无符号的 BIGINT 类型列
			//外键关联, onDelete('cascade')表示约束的“on delete”和“on update”属性
			$table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
			$table->string('province'); // 省
			$table->string('city'); // 市
			$table->string('district'); // 区
			$table->string('address'); //具体地址
			$table->unsignedInteger('zip');   // 邮编
			$table->string('contact_name');   // 联系人姓名
			$table->string('contact_phone');  // 联系人电话
			$table->dateTime('last_used_at')->nullable();  //最后一次使用时间
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
        Schema::dropIfExists('user_addresses');
    }
}
