<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\FoodItem;
use Gloudemans\Shoppingcart\Facades\Cart;

class HomeController extends Controller
{
    //
    public function index()
    {
        $categories = Category::all();
        //dd($category);
        $new_foods =  FoodItem::where('quantity' ,'>', 0)->orderByDESC('created_at')->limit(6)->get();
        // dd($new_foods);
        $carts=Cart::content();
        $cart_total=Cart::total();
        $slide_foods= FoodItem::where('quantity' ,'>', 0)->orderByDESC('created_at')->limit(5)->get();
        return view('front.home', [
            'categories' => $categories,
            'new_foods'  => $new_foods,
            'carts' => $carts,
            'cart_total' => $cart_total,
            'slide_foods' => $slide_foods
        ]);
    }
}
