<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\User;
use App\Models\FoodOrder;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\Session;

class CheckoutController extends Controller
{
    public function index(Request $req){
        // $customer=User::find(1)->customer;
        $cs_id=Session::get('customer_id');
        $customer= Customer::find($cs_id);
        $carts= Cart::content();
        $total= Cart::total();
        return view('front.checkout.checkout',compact('carts','total', 'customer'));
    }
    public function checkoutSubmit(Request $req){
        $cs_id=Session::get('customer_id');
        $customer= Customer::find($cs_id);
        $note=$req->note? $req->note : '';
        $carts= Cart::content();
        $order= FoodOrder::create([
            'cs_id' => $customer->id,
            'total_price' =>Cart::total(0,'','') ,
            'note' => $note,
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
