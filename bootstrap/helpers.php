<?php
use \Illuminate\Support\Facades\Route;

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
