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
        // 处理退款
        $router->post('orders/{order}/refund', 'OrdersController@handleRefund')->name('admin.orders.handle_refund');
        // 优惠劵列表
        $router->get('coupon_codes', 'CouponCodesController@index');
        // 创建优惠劵
        $router->post('coupon_codes', 'CouponCodesController@store');
        $router->get('coupon_codes/create', 'CouponCodesController@create');
        // 修改优惠劵
        $router->put('coupon_codes/{id}', 'CouponCodesController@update');
        $router->get('coupon_codes/{id}/edit', 'CouponCodesController@edit');
        // 删除优惠劵
        $router->delete('coupon_codes/{id}/delete', 'CouponCodesController@destory');
        // 栏目
        $router->get('categories', 'CategoriesController@index');
        $router->get('categories/create', 'CategoriesController@create');
        $router->get('categories/{id}/edit', 'CategoriesController@edit');
        $router->post('categories', 'CategoriesController@store');
        $router->put('categories/{id}', 'CategoriesController@update');
        $router->delete('categories/{id}', 'CategoriesController@destory');
        $router->get('api/categories', 'CategoriesController@apiIndex');

    }
);
