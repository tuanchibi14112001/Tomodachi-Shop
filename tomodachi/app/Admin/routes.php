<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('user', UserController::class);
    $router->resource('category', CategoryController::class);
    $router->resource('food-items', FoodItemController::class);
    $router->resource('food-orders', FoodOrderController::class);

});
