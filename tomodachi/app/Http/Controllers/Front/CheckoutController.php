<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\FoodItem;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\User;
use App\Models\FoodOrder;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use PhpParser\Node\Stmt\TryCatch;

class CheckoutController extends Controller
{
    public function index(Request $req){
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
        $message="checkout error!!!";
        try {
            DB::beginTransaction();
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
                $fooditem=FoodItem::find($cart->id);
                if($fooditem->quantity<$cart->qty) $message.="$fooditem->name only $fooditem->quantity left";
                OrderDetail::create($data);
                
                DB::commit();
                $message="Order success!!!";

            }
            
        } catch (\PDOException $e) {
            DB::rollBack();
        }
        
        

        Cart::destroy();
        return redirect()->route('orders.view',['message'=>$message]);
    }
}
