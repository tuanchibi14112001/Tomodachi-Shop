<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\FoodOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class OrderController extends Controller
{
    public function view($message=null){
        $cs_id=Session::get('customer_id');
        $orders= FoodOrder::where('cs_id',$cs_id)->get();
        //dd($orders->count());
        return view('front.orders.orders',['orders'=> $orders, 'message'=>$message]);
    }
}
