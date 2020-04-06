<?php


function route_class() {
	return str_replace('.', '-', Route::currentRouteName());
}

function ngrok_url($routeName, $parameters = []) {
    // 如果是开发环境, 并且配置了NGROK_URL
    if (app()->environment('local') && $url = config('app.ngrok_url')) {
        // route() 函数第三个参数表示是否是绝对路径
        return $url . route($routeName, $parameters, false);
    }

    return route($routeName, $parameters);
}

function test() {
    $crowdfunding = \App\Models\Order::query()->find(10)->items[0]->product->crowdfunding;
    $data = \App\Models\Order::query()
        ->where('type',  \App\Models\Order::TYPE_CROWDFUNDING)
        ->whereNotNull('paid_at')
        ->whereHas('items', function ($query) use ($crowdfunding) {
            $query->where('product_id', $crowdfunding->product_id);
        })->first([
            \DB::raw('sum(total_amount) as total_amount'),
            \DB::raw('count(distinct(user_id)) as user_count')
        ]);

    dd($data->toArray());
    $crowdfunding->update([
        'total_amount' => $data->total_amount,
        'user_count' => $data->user_count
    ]);
}
