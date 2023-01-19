<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Front;
use App\Http\Controllers\Front\ShopController;
use App\Models\FoodItem;
use Illuminate\Http\Request;
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

Route::get('/', [Front\HomeController::class, 'index']);

Route::get('/shop/about', function () {
    return view('front.shop.about');
});

Route::get('/shop/quick_view/food_id={id}', [ShopController::class, 'quick_view']);

Route::get('/shop/menu/{id}', [ShopController::class, 'menu']);
// Route::get('/test', function () {
//     return FoodItem::find(1)->category['name'];
// });
// Route::get('/test', function () {
//     return \App\Models\FoodItem::find(3)->Category;
// });
