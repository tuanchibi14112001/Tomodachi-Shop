<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\FoodOrder;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function view($message=null){
        $orders= FoodOrder::all();
        //dd($orders->count());
        return view('front.orders.orders',['orders'=> $orders, 'message'=>$message]);
    }
}
