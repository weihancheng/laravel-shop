<?php

use Illuminate\Database\Seeder;

class ProductsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // 创建 30个商品
		$products = factory(\App\Models\Product::class, 30)->create();
		foreach ($products as $product) {
			// 创建 3个SKU, 并每个SKU的'product_id'字段都涩味当前循环商品id
			$skus = factory(\App\Models\ProductSku::class, 3)->create(['product_id' => $product->id]);
			// 找到价格最低的SKU价格, 把商品价格设置为该价格
			$product->update(['price' => $skus->min('price')]);
		}
    }
}
