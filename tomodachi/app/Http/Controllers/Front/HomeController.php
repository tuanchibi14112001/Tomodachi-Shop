<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\FoodItem;

class HomeController extends Controller
{
    //
    public function index()
    {
        $categories = Category::all();
        //dd($category);
        $new_foods =  FoodItem::orderByDESC('id')->limit(10)->get();
        // dd($new_foods);
        return view('front.home', [
            'categories' => $categories,
            'new_foods'  => $new_foods,
        ]);
    }
}
