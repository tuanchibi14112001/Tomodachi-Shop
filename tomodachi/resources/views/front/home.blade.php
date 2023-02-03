@extends('front.master')
@section('title', 'Home')
@section('body')
    <section class="hero">

        <div class="swiper hero-slider">

            <div class="swiper-wrapper">
                @foreach ($slide_foods as $slide_food)
                    <div class="swiper-slide slide">
                        <div class="content">
                            <span>New food</span>
                            <h3>{{ $slide_food->name }}</h3>
                            <a href="{{ route('quick_view', ['id' => $slide_food->id]) }}" class="btn">quick view</a>
                        </div>
                        <div class="image">
                            <img src="uploads/{{ $slide_food->url }}" alt="">
                        </div>
                    </div>
                @endforeach

            </div>

            <div class="swiper-pagination"></div>

        </div>

    </section>

    <section class="category">

        <h1 class="title">food category</h1>

        <div class="box-container">
            @foreach ($categories as $category)
                <a href="/shop/menu#{{ $category->id }}" class="box">
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
                    @include('front.components.food_items', ['food_item' => $new_food])
                @endforeach
            @else
                <p class="empty">no products added yet!</p>
            @endif
        </div>

        <div class="more-btn">
            <a href="/shop/menu#1" class="btn">view all</a>
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
