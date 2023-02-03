<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Customer;
use Illuminate\Support\Facades\Session;
use Hash;
use Gloudemans\Shoppingcart\Facades\Cart;


use Illuminate\Http\Request;

class CustomAuthController extends Controller
{
    public function login(Request $request){
        if(Session::exists('customer_id')){ 
            Cart::destroy();
            Session::forget('customer_id');
        }
        return view('front.auth.login');
    }
    public function loginStore(Request $request){
        $request->validate([
            'email' => 'required|email:filter',
            'password' => 'required',
        ]);
        $user = User::where('email', '=', $request->email)->first();
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                Session::put('customer_id', $user->cs_id);
                // $request->session()->put('customer_id', $user->cs_id);
                return redirect()->action([HomeController::class, 'index'], ['cs_id' => $user->cs_id]);             
            }else {
                return redirect()->back()->with('fail', 'Incorrect password or email');
            }

        } else {
            return redirect()->back();
        }
    }

    public function register(){
        return view('front.auth.register');
    }

    public function registerUser(Request $request)
    {
        $request->validate([
            'name'=>'required',
            'email'=>'required|email|unique:user',
            'number'=>'required',
            'password'=>'required|min:6|max:20',
            'cpass'=>'required|same:password',

        ]);
        $customer = new Customer();
        $customer->name = $request->name;
        $customer->phone_num = $request->number;
        $resCus = $customer->save();
        
        $user = new User();

        $user->cs_id = $customer->id;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $resUser = $user->save();

        if ($resCus && $resUser){
            
            return redirect('/login')->with('success', 'You have registered successfully');
        }else {
            return redirect()->back();
        }
    }

}
