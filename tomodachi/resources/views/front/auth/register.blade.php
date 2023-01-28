@extends('front.master')
@section('title', 'register')
@section('body')

    <section class="form-container">

        <form action="{{ route('register_user') }}" method="post">
            
            @csrf
            @include('front.alert')
            {{-- <h3>register now</h3> --}}
            <div class="form-group">
                <input type="text" required maxlength="20" name="name" placeholder="enter your name" class="box"
                    oninput="this.value = this.value.replace(/\s/g, '')">
                    
            </div>
            <div class="form-group">
                <input type="email" required maxlength="50" name="email" placeholder="enter your email" class="box"
                    oninput="this.value = this.value.replace(/\s/g, '')">            

            </div>
            <div class="form-group">
                <input type="numner" min="0" max="9999999999" onkeypress="if(this.value.length == 10) return false;"
                placeholder="enter your number" required class="box" name="number">   

            </div>
            <div class="form-group">
                <input type="password" required maxlength="20" name="password" placeholder="enter your password" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">

            </div>
            <div class="form-group">
                <input type="password" required maxlength="20" name="cpass" placeholder="confirm your password" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">
                
            </div>
            <div class="form-group">
                <input type="submit" value="register now" class="btn" name="submit">
            </div>
            <p>already have an account? <a href="login">login now</a></p>

            
            
            
        </form>

    </section>

@endsection
