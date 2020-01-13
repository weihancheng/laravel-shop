<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
        	// SKU = Stock Keeping Unit（库存量单位），也可以称为『单品』。
            $table->bigIncrements('id');
            $table->string('title');  // 商品名称
            $table->text('description');  // 商品描述
            $table->string('image');  // 商品图片
            $table->boolean('on_sale')->default(true); //是否正在售卖
            $table->float('rating')->default(5); // 商品平均评分
            $table->unsignedInteger('sold_count')->default(0); // 销量
            $table->unsignedInteger('review_count')->default(0); // 评价数量
            $table->decimal('price', 10, 2); // SKU最低价格 , 我们在商品表放置 price 字段的目的是方便用户搜索、排序
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
        Schema::dropIfExists('products');
    }
}
