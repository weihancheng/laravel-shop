<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductsController extends Controller
{
	// 商品列表页
	public function index(Request $request)
	{
		// 创建一个查询构造器
		$builder = Product::query()->where('on_sale', true);
		// 判断是否有提交search 参数, 如果有就赋值给 $search变量
		// search 参数用来模糊查询商品
		if ($search = $request->input('search', '')) {
			$like = '%'.$search.'%';
			// 模糊查询商品标题, 商品详情, SKU 标题, SKU描述
			$builder->where(function ($query) use($like) {
				$query->where('title', 'like', $like)->orWhere('description', 'like', $like)->orWhereHas('skus', function($query) use ($like) {
					$query->where('title', 'like', $like)->orWhere('description', 'like', $like);
				});
			});
		}

		// 是否有提交 order参数, 如果有就赋值$order变量
		// order 参数用来控制商品的排序规则
		if ($order = $request->input('order', '')) {
			// 是否是 _asc 或者 _desc结尾
			if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
				// 如果字符串是['pirce', 'sold_count', 'rating']之一,说明是合法的
				if (in_array($m[1], ['price', 'sold_count', 'rating'])) {
					// 根据传入的排序值来构造排序参数
					$builder->orderBy($m[1], $m[2]);
				}
			}
		}

		$products = $builder->paginate(16);
		return view('products.index', [
			'products' => $products,
			'filters' => [
				'search' => $search,
				'order' => $order
			]
		]);
	}

	// 商品详情页
	public function show(Product $product, Request $request)
	{
		if (!$product->on_sale) {
			throw new \Exception('商品未上架');
		}

		return view('products.show', ['product' => $product]);
	}
}
