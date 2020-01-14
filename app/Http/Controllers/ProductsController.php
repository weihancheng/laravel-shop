<?php

namespace App\Http\Controllers;

use App\Models\Product;

class ProductsController extends Controller
{

	public function index()
	{
		// query()不加也可以，加 query() 是为了配合 laravel-ide-helper 做代码提示
		$products = Product::query()->where('on_sale', true)->paginate(16);
		return view('products.index', compact('products'));
	}
}
