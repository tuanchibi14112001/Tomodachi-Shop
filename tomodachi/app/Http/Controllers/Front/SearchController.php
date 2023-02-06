<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FoodItem;

class SearchController extends Controller
{
    public function index(Request $req){
        $foods =  FoodItem::orderByDESC('created_at')->limit(20)->get();
        return view('front.shop.search',compact('foods'));
        
    }
    public function searchPost(Request $req){
        $name=$req->search_box;
        $foods=FoodItem::Where('name', 'like', '%' . $name . '%')->get();
        return view('front.shop.search',compact('foods','name'));
    }
}
