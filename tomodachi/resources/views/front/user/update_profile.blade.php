@extends('front.master')
@section('title', 'update_profile')
@section('body')

    <section class="form-container">
        <?php
        $customer_id = request()->query('cs_id');
        ?>
        <form action="{{ route('update_profile_post',['cs_id'=>$customer_id]) }}" method="POST">
            @if(Session::has('fail'))
            <div class="alert alert-danger" style="font-size:20px; color:red;">{{ Session::get('fail') }}</div>
            @endif
            @csrf
            @include('front.alert')
            <h3>update profile</h3>
            <input type="text" maxlength="50" name="name" placeholder="enter your name" class="box"
                oninput="this.value" >
            <input type="text" min="0" max="9999999999" onkeypress="if(this.value.length == 10) return false;"
                placeholder="enter your number" class="box" name="number" inputmode="decimal" pattern="[0-9,\.]*" >
            <input type="date" maxlength="50" name="birthday" class="box" 
                oninput="this.value" >
            <input type="text" maxlength="50" name="url" placeholder="enter your url" class="box"
                oninput="this.value" >
            <input type="address" name="address" placeholder="enter your address" class="box"
                oninput="this.value" >
            <input type="submit" value="update now" class="btn" name="submit">
        </form>

    </section>

@endsection
