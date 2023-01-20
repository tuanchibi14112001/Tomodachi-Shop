@extends('front.master')
@section('title', 'login')
@section('body')

    <section class="form-container">

        <form action="" method="post">
            <h3>login now</h3>
            <div class="form-group">
                <input type="email" required maxlength="50" name="email" placeholder="enter your email" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">
            </div>
            <div class="form-group">
                <input type="password" required maxlength="20" name="pass" placeholder="enter your password" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">
            </div>
            <div class="form-group">
                <input type="submit" value="login now" class="btn" name="submit">
            </div>

            <p>don't have an account? <a href="register">register now</a></p>

        </form>

    </section>
@endsection
