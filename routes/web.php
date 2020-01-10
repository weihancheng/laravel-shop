<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PagesController@root')->name('root');

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
});
