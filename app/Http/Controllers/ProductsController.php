<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\Category;
use App\Models\OrderItem;
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

		if ($request->input('category_id') && $category = Category::query()->find($request->input('category_id'))) {
		    // 如果这是一个父类目
            if ($category->is_directory) {
                // 筛选该类目下的所有子类目商品
                $builder->whereHas('category', function ($query) use ($category) {
                    $query->where('path', 'like', $category->path.$category->id.'-%');
                });
            } else {
                // 如果这不是一个父类目, 则直接筛选此类目下单商品
                $builder->where('category_id', $category->id);
            }
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
			],
            'category' => $category ?? null
		]);
	}

	// 商品详情页
	public function show(Product $product, Request $request)
	{
		if (!$product->on_sale) {
			throw new InvalidRequestException('商品未上架');
		}

		$favored = false;
		if ($user = $request->user()) {
		    $favored = boolval($user->favoriteProducts()->find($product->id));
        }

		// 评论列表
        $reviews = OrderItem::query()
            ->with('order.user', 'productSku')
            ->where('product_id', $product->id)
            ->whereNotNull('reviewed_at')
            ->orderBy('reviewed_at')
            ->limit(10)
            ->get();

		return view('products.show', compact('product', 'favored', 'reviews'));
	}

	// 商品收藏
    public function favor(Product $product, Request $request) {
        $user = $request->user();
        // 判断用户是否已经收藏了该商品
        if ($user->favoriteProducts()->find($product->id)) {
            return [];
        }

        // attach() 方法的参数可以是模型的 id，也可以是模型对象本身
        $user->favoriteProducts()->attach($product);
        return [];
	}

	// 取消商品收藏
    public function disfavor(Product $product, Request $request) {
        $user = $request->user();
        // detach() 方法用于取消多对多的关联，接受的参数个数与 attach() 方法一致
        $user->favoriteProducts()->detach($product);
        return [];
	}

    public function favorites(Request $request) {
        $products = $request->user()->favoriteProducts()->paginate(16);
        return view('products.favorites', compact('products'));
    }
}
