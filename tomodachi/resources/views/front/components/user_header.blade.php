<?php
$db_name = 'mysql:host=localhost;dbname=food_db';
$user_name = 'root';
$user_password = '';
$conn = new PDO($db_name, $user_name, $user_password);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"images>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <base href="{{ asset('/') }}">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="front/css/style.css">
    <script src="front/js/jquery.min.js"></script>


</head>

<body>

    <header class="header">

        <section class="flex">

            <a href="home.php" class="logo">yum-yum 😋</a>

            <nav class="navbar">
                <a href="/">home</a>
                <a href="shop/about">about</a>
                <a href="/shop/menu#1">menu</a>
                <a href="{{ route('orders.view') }}">orders</a>
            </nav>
            <div class="icons">
                <a href="{{ route('search') }}"><i class="fas fa-search icon"></i></a>
                <a href="#" id="cart"
                    class="show-cart icon @if (Route::current()->getName() == 'cart.index' || Route::current()->getName() == 'checkout') disabled @endif"><i
                        class="fas fa-shopping-cart"></i><span>({{ Cart::count() }})</span></a>

                <div id="user-btn" class="fas fa-user icon"></div>
                <div id="menu-btn" class="fas fa-bars icon"></div>
                <div class="left_nav">

                    @include('front.components.header_cart', [
                        'carts' => Cart::content(),
                        'cart_total' => Cart::total(),
                    ])
                </div>
            </div>

            <div class="profile">


                @php
                    $customer_id = Session::get('customer_id');
                    $select_profile = $conn->prepare('SELECT * FROM `customer` WHERE id = ?');
                    $select_profile->execute([$customer_id]);
                    if ($select_profile->rowCount() > 0) {
                        $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
                    }
                @endphp

                @if ($customer_id)
                    <p class="name">{{ $fetch_profile['name'] }}</p>
                    <div class="flex" style="justify-content: center;">
                        <a href="{{ url('profile/?cs_id=' . $customer_id) }}" class="btn">profile</a>

                    </div>
                    <div class="flex" style="justify-content: center;">
                        <a href="{{ url('profile/update_password/?cs_id=' . $customer_id) }}" class="btn">change
                            password</a>
                    </div>

                    <div class="flex" style="justify-content: center;">
                        <a href="login" onclick="return confirm('logout from this website?');"
                            class="delete-btn">logout</a>
                    </div>
                @else
                    <p class="name">please login first!</p>
                    <div class="flex">
                        <a href="register" class="btn">register</a>
                        <a href="login" class="btn">login</a>
                    </div>
                @endif


            </div>

        </section>

    </header>
