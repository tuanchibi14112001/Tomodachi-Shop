<?php

@include 'components/connect.php';
$db_name = 'mysql:host=localhost;dbname=food_db';
$user_name = 'root';
$user_password = '';
$conn = new PDO($db_name, $user_name, $user_password);
session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = '';
}

@include 'components/add_cart.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>quick view</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- custom css file link  -->
    <base href="{{ asset('/') }}">
    <link rel="stylesheet" href="front/css/style.css">

</head>

<body>

    @include ('front/components/user_header')

    <section class="quick-view">

        <h1 class="title">quick view</h1>
        @if ($food != null)
            <form action="" method="post" class="box">
                <input type="hidden" name="pid" value="{{ $food->id }} ">
                <input type="hidden" name="name" value="{{ $food->name }} ">
                <input type="hidden" name="price" value="{{ $food->price }} ">
                <input type="hidden" name="image" value="{{ $food->url }} ">
                <img src="front/uploaded_img/{{ $food->url }} " alt="">
                <a href="category.php?category={{ $food->category->name }} "
                    class="cat">{{ $food->category->name }} </a>
                <div class="name">{{ $food->name }} </div>
                <div class="flex">
                    <div class="price"><span>$</span>{{ $food->price }}</div>
                    <input type="number" name="qty" class="qty" min="1" max="99" value="1"
                        maxlength="2">
                </div>
                <button type="submit" name="add_to_cart" class="cart-btn">add to cart</button>
            </form>
        @else
            <p class="empty">no products added yet!</p>
        @endif


    </section>
    @include('front/components/footer')
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <!-- custom js file link  -->
    <script src="front/js/script.js"></script>


</body>

</html>
