<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;

class HomeController extends Controller
{
    //
    public function index(){
        $categories = Category::all();
        //dd($category);
        return view('front.home',[
            'categories' => $categories
        ]);
    }
}
