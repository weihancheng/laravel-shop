<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group(
    [
        'prefix' => config('admin.route.prefix'),
        'namespace' => config('admin.route.namespace'),
        'middleware' => config('admin.route.middleware'),
    ],
    function (Router $router) {
        $router->get('/', 'HomeController@index')->name('admin.home');
        // 用户管理
        $router->get('users', 'UsersController@index')->name('admin.users');
        // 商品管理
        $router->get('products', 'ProductsController@index');
        // 添加商品
        $router->get('products/create', 'ProductsController@create');
        $router->post('products', 'ProductsController@store');
        // 编辑商品
        $router->get('products/{id}/edit', 'ProductsController@edit');
        $router->put('products/{id}', 'ProductsController@update');
        // 订单列表页
        $router->get('orders', 'OrdersController@index')->name('admin.orders.index');
        // 订单详情
        $router->get('orders/{order}', 'OrdersController@show')->name('admin.orders.show');
        // 发货
        $router->post('orders/{order}/ship', 'OrdersController@ship')->name('admin.orders.ship');
    }
);
