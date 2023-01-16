<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\FoodItem;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    //
    public function quick_view($id){
        $food = FoodItem::where('id', $id)->first();
        return view('front.shop.quick_view',[
            'food' => $food,
        ]);
    }
}
