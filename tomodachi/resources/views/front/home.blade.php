<?php
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge"images>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="front/css/style.css">

</head>

<body>

    @include('front.components.user_header');

    <section class="hero">

        <div class="swiper hero-slider">

            <div class="swiper-wrapper">

                <div class="swiper-slide slide">
                    <div class="content">
                        <span>order online</span>
                        <h3>delicious pizza</h3>
                        <a href="menu.html" class="btn">see menus</a>
                    </div>
                    <div class="image">
                        <img src="front/images/home-img-1.png" alt="">
                    </div>
                </div>

                <div class="swiper-slide slide">
                    <div class="content">
                        <span>order online</span>
                        <h3>chezzy hamburger</h3>
                        <a href="menu.html" class="btn">see menus</a>
                    </div>
                    <div class="image">
                        <img src="front/images/home-img-2.png" alt="">
                    </div>
                </div>

                <div class="swiper-slide slide">
                    <div class="content">
                        <span>order online</span>
                        <h3>rosted chicken</h3>
                        <a href="menu.html" class="btn">see menus</a>
                    </div>
                    <div class="image">
                        <img src="front/images/home-img-3.png" alt="">
                    </div>
                </div>

            </div>

            <div class="swiper-pagination"></div>

        </div>

    </section>

    <section class="category">

        <h1 class="title">food category</h1>

        <div class="box-container">
            @foreach ($categories as $category)
                <a href="category.php?category={{ $category->name }}" class="box">
                    <img src="front/images/{{ $category->image }}" alt="">
                    <h3>{{ $category->name }}</h3>
                </a>
            @endforeach
        </div>
    </section>

    <section class="products">

        <h1 class="title">latest dishes</h1>

        <div class="box-container">
            @if ($new_foods != null)
                @foreach ($new_foods as $new_food)
                    <form action="" method="post" class="box">
                        <input type="hidden" name="pid" value="{{ $new_food->id }}">
                        <input type="hidden" name="name" value=" {{ $new_food->name }}">
                        <input type="hidden" name="price" value=" {{ $new_food->price }}">
                        <input type="hidden" name="image" value=" {{ $new_food->url }}">
                        <a href="quick_view.php?pid= {{ $new_food->id }}" class="fas fa-eye"></a>
                        <button type="submit" class="fas fa-shopping-cart" name="add_to_cart"></button>
                        <img src="front/uploaded_img/{{ $new_food->url }}" alt="">
                        <a href="category.php?category= {{ $new_food->category['name'] }}" class="cat">
                            {{ $new_food->category['name'] }}</a>
                        <div class="name"> {{ $new_food->name }}</div>
                        <div class="flex">
                            <div class="price"><span>$</span> {{ $new_food->price }}</div>
                            <input type="number" name="qty" class="qty" min="1" max="99"
                                value="1" maxlength="2">
                        </div>
                    </form>
                @endforeach
            @else
                <p class="empty">no products added yet!</p>
            @endif
        </div>

        <div class="more-btn">
            <a href="menu.html" class="btn">view all</a>
        </div>

    </section>

    @include ('front.components.footer');


    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <!-- custom js file link  -->
    <script src="front/js/script.js"></script>

    <script>
        var swiper = new Swiper(".hero-slider", {
            loop: true,
            grabCursor: true,
            effect: "flip",
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
        });
    </script>

</body>

</html>
