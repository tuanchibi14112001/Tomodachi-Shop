<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Customer;
use Hash;


use Illuminate\Http\Request;

class UserController extends Controller
{
    public function profile()
    {
        return view('front.user.profile');
    }

    public function updateProfile()
    {
        return view('front.user.update_profile');
    }

    public function updateProfilePost(Request $request)
    {
        $request->validate([
            'name' => 'max:50',
            'number'=>'required|min:6|max:11',
        ]);
        
        $customer_id = $request['cs_id'];
        $customer = Customer::where('id', '=', $customer_id)->first();
        if ($customer) {
            if($request->name){     
                $customer->name = $request->name;
            }
            if($request->number){
                $customer->phone_num = $request->number;
            }

            if($request->birthday){
                $customer->dob = $request->birthday;
                
            }

            if($request->url){
                $customer->url = $request->url;
            }

            if($request->address){
                $customer->address = $request->address;
            }
            
            $resCus = $customer->save();

            if ($resCus) {

                return redirect()->action([UserController::class, 'profile'], ['cs_id' => $customer_id]);
            } else {
                return redirect()->back()->with('fail', 'User cannot be identified');
            }

        } else {
            return redirect()->back()->with('fail', 'User cannot be identified');
        }
    }

    public function updatePassword()
    {
        return view('front.user.update_password');
    }

    public function updatePasswordPost(Request $request)
    {
        $request->validate([
            'old_pass' => 'required|min:6|max:20',
            'new_pass' => 'required|min:6|max:20|different:old_pass',
            'confirm_pass' => 'required|same:new_pass',
        ]);
        $customer_id = $request['cs_id'];
        $user = User::where('cs_id', '=', $customer_id)->first();
        if ($user) {
            if (Hash::check($request->old_pass, $user->password)) {
                $user->password = Hash::make($request->new_pass);
                $resUser = $user->save();
            }else {
                return redirect()->back()->with('fail', 'Old password is incorrect');
            }

            if ($resUser) {
                return redirect()->action([UserController::class, 'profile'], ['cs_id' => $customer_id]);
            } else {
                return redirect()->back();
            }

        } else {
            return redirect()->back()->with('fail', 'User cannot be identified');
        }
    }
}