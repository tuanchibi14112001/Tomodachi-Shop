<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Front;
use App\Http\Controllers\Front\CartController;
use App\Http\Controllers\Front\ShopController;
use App\Http\Controllers\Front\CheckoutController;
use App\Http\Controllers\Front\OrderController;


/*
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

Route::get('/shop/menu', [ShopController::class, 'menu']);

// Route::get('/test', function () {
//     return FoodItem::find(1)->category['name'];
// });
// Route::get('/test', function () {
//     return \App\Models\FoodItem::find(3)->Category;
// });

Route::prefix('cart')->name("cart.")->group(function () {
    Route::get('/', [CartController::class,'index'])->name('index');
    Route::get('/add', [CartController::class,'add'])->name('add');
    Route::get('/delete/{rowId}', [CartController::class,'delete'])->name('delete');
    Route::get('/destroy', [CartController::class,'destroy'])->name('destroy');
    Route::get('/update', [CartController::class,'update'])->name('update');
});
Route::get('checkout',[CheckoutController::class,'index'])->name("checkout");
Route::post('checkout',[CheckoutController::class,'checkoutSubmit'])->name("checkout.submit");
Route::prefix('/orders')->name("orders.")->group(function () {
    Route::get('/view/{message?}', [OrderController::class,'view'])->name('view');
});