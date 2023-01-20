@extends('front.master')
@section('title',"Home")
@section('body')
<section class="hero">

    <div class="swiper hero-slider">

        <div class="swiper-wrapper">

            <div class="swiper-slide slide">
                <div class="content">
                    <span>order online</span>
                    <h3>delicious pizza</h3>
                    <a href="/shop/menu/1" class="btn">see menus</a>
                </div>
                <div class="image">
                    <img src="front/images/home-img-1.png" alt="">
                </div>
            </div>

            <div class="swiper-slide slide">
                <div class="content">
                    <span>order online</span>
                    <h3>chezzy hamburger</h3>
                    <a href="/shop/menu/1" class="btn">see menus</a>
                </div>
                <div class="image">
                    <img src="front/images/home-img-2.png" alt="">
                </div>
            </div>

            <div class="swiper-slide slide">
                <div class="content">
                    <span>order online</span>
                    <h3>rosted chicken</h3>
                    <a href="/shop/menu/1" class="btn">see menus</a>
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
            <a href="/shop/menu/{{ $category->id }}" class="box">
                <img src="uploads/{{ $category->image }}" alt="">
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
                @include('front.components.food_items',['food_item'=>$new_food])
            @endforeach
        @else
            <p class="empty">no products added yet!</p>
        @endif
    </div>

    <div class="more-btn">
        <a href="/shop/menu/1" class="btn">view all</a>
    </div>

</section>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
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
@endsection