<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\User;
use App\Models\FoodOrder;
use App\Models\OrderDetail;

class CheckoutController extends Controller
{
    public function index(){
        $customer=User::find(1)->customer;
        $carts= Cart::content();
        $total= Cart::total();
        return view('front.checkout.checkout',compact('carts','total', 'customer'));
    }
    public function checkoutSubmit(Request $req){
        $customer=User::find(1)->customer;
        $carts= Cart::content();
        $order= FoodOrder::create([
            'cs_id' => $customer->id,
            'total_price' =>Cart::total(0,'','') ,
            'note' => $req->note,
            'status' => 0
        ]);
        foreach( $carts as $cart){
            $data=[
                'food_id' => $cart->id,
                'order_id'=> $order->id,
                'quantity'=> $cart->qty
            ];
            OrderDetail::create($data);
        }

        Cart::destroy();
        return redirect()->route('orders.view',['message'=>'Order success!!!']);
    }
}
