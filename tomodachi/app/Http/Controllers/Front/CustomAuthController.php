<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class CustomAuthController extends Controller
{
    public function login(){
        return view('front.auth.login');
    }
    public function register(){
        return view('front.auth.register');
    }
}
