@extends('front.master')
@section('title', 'update_profile')
@section('body')

    <section class="form-container">
        <?php
        $customer_id = request()->query('cs_id');
        ?>
        <form action="{{ route('update_password_post',['cs_id'=>$customer_id]) }}" method="POST">
            @if (Session::has('fail'))
                <div class="alert alert-danger" style="font-size:20px; color:red;">{{ Session::get('fail') }}</div>
            @endif
            @csrf
            @include('front.alert')
            <h3>update password</h3>
            <input type="password" minlength="6" maxlength="20" name="old_pass" placeholder="enter your old password"
                class="box" oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="password" minlength="6" maxlength="20" name="new_pass" placeholder="enter your new password"
                class="box" oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="password" minlength="6" maxlength="20" name="confirm_pass" placeholder="confirm your new password"
                class="box" oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="submit" value="update now" class="btn" name="submit">
        </form>

    </section>

@endsection
