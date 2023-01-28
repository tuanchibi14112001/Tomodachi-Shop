<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\FoodItem;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
class CartController extends Controller
{
    public function index(){

        $carts= Cart::content();
        $total= Cart::total();
        $count= Cart::count();
        $subtotal= Cart::subtotal();
        return view('front.shop.cart',compact('carts','total','subtotal','count'));
    }
    public function add(Request $req){
        Cart::add([
            'id' => $req->pid,
            'name' => $req->name,
            'qty' => $req->qty,
            'weight' => 0,
            'price' => $req->price,
            'options' => [
                'image' => $req->image,
                ]
        ]);
        // Cart::destroy();
        $view= view('front.components.header_cart', [
            'carts' => Cart::content(),
            'cart_total' => Cart::total()
        ])->render();
        return response()->json(['view' =>$view, 'count'=> Cart::count()]);
        
    }
    public function delete($rowId){
        Cart::remove($rowId);
        return back();
    }
    public function destroy(){
        Cart::destroy();
        return back();
    }
    public function update(Request $req){
        if($req->ajax()){
            Cart::update($req->rowId,$req->qty);
            $cart=Cart::get($req->rowId);
            return response()->json([
                'total_price' => Cart::total(),
                'sub_total' =>$cart->subtotal,
                'count' => Cart::count()
            ]);
        }
    }
}
