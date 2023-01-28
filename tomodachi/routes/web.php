<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Front;
use App\Http\Controllers\Front\CartController;
use App\Http\Controllers\Front\ShopController;
use App\Http\Controllers\Front\CustomAuthController;
use App\Http\Controllers\Front\UserController;

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

Route::get('/shop/menu/{id}', [ShopController::class, 'menu']);
// Route::get('/test', function () {
//     return FoodItem::find(1)->category['name'];
// });
// Route::get('/test', function () {
//     return \App\Models\FoodItem::find(3)->Category;
// });

Route::prefix('cart')->name("cart.")->group(function () {
    Route::get('/', [CartController::class,'index'])->name('index');
    Route::post('/add', [CartController::class,'add'])->name('add');
});

Route::get('/login', [CustomAuthController::class, 'login']);
Route::post('/login_store', [CustomAuthController::class, 'loginStore'])->name('login_store');

Route::get('/register', [CustomAuthController::class, 'register']);
Route::post('/register_user', [CustomAuthController::class, 'registerUser'])->name('register_user');

Route::get('/profile', [UserController::class, 'profile']);


// đăng kí thành công chưa hiển thị thông báo , chưa làm được phần đăng nhập, đăng nhập xong không hiển thị thông tin người dùng 
// chưa thêm sửa xóa thông tin người dùng.