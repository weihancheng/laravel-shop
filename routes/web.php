<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the 'web' middleware group. Now create something great!
|
*/

Route::redirect('/', '/products')->name('root');
Route::get('products', 'ProductsController@index')->name('products.index');

Auth::routes(['verify' => true]);

Route::group(['middleware' => ['auth', 'verified']], function() {
	// 列表页
	Route::get('user_addresses', 'UserAddressesController@index')->name('user_addresses.index');
	// 创建收货地址
	Route::get('user_addresses/create', 'UserAddressesController@create')->name('user_addresses.create');
	// 新增收货地址逻辑
	Route::post('user_addresses', 'UserAddressesController@store')->name('user_addresses.store');
	// 修改收货地址
	Route::get('user_addresses/{user_address}', 'UserAddressesController@edit')->name('user_addresses.edit');
	// 修改逻辑
	Route::put('user_addresses/{user_address}', 'UserAddressesController@update')->name('user_addresses.update');
	// 删除逻辑
	Route::delete('user_addresses/{user_address}', 'UserAddressesController@destroy')->name('user_addresses.destroy');
	// 收藏商品
    Route::post('products/{product}/favorite', 'ProductsController@favor')->name('products.favor');
    // 取消收藏商品
    Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('products.disfavor');
    // 收藏列表
    Route::get('products/favorites', 'ProductsController@favorites')->name('products.favorites');
    // 购物车添加商品
    Route::post('cart', 'CartController@add')->name('cart.add');
    // 购物车列表
	Route::get('cart', 'CartController@index')->name('cart.index');
	// 移除购物车
	Route::delete('cart/{sku}', 'CartController@remove')->name('cart.remove');
});

// 这里和其他路由产生冲突
Route::get('products/{product}', 'ProductsController@show')->name('products.show');
