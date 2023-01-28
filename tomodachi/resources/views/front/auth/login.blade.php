@extends('front.master')
@section('title', 'login')
@section('body')

    <section class="form-container">

        <form action="{{ route('login_store') }}" method="post">
            @if(Session::has('success'))
            <div class="alert alert-success" style="font-size:20px; color:blue;">{{ Session::get('success') }}</div>
            @endif
            @csrf
            @include('front.alert')
            {{-- <h3>login now</h3> --}}
            <div class="form-group">
                <input type="email" required maxlength="50" name="email" placeholder="enter your email" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">
            </div>
            <div class="form-group">
                <input type="password" required maxlength="20" name="password" placeholder="enter your password" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">
            </div>
            <div class="form-group">
                <input type="submit" value="login" class="btn" name="submit">
            </div>

            <p>don't have an account? <a href="register">register now</a></p>

        </form>

    </section>
@endsection
