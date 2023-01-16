@extends('front.master')
@section('title',"Quick View")
@section('body')
    <section class="quick-view">

        <h1 class="title">quick view</h1>
        @if ($food != null)
            <div class="qv-food-all">
                <img class="food-image" src="front/uploaded_img/{{ $food->url }} " alt="">
                <div class="food-info">
                    <form action="" method="post" class="box" class="qv-food-info">
                        <input type="hidden" name="pid" value="{{ $food->id }} ">
                        <input type="hidden" name="name" value="{{ $food->name }} ">
                        <input type="hidden" name="price" value="{{ $food->price }} ">
                        <input type="hidden" name="image" value="{{ $food->url }} ">
                        <a href="category.php?category={{ $food->category->name }} "
                            class="cat">{{ $food->category->name }} </a>
                        <div class="name">{{ $food->name }} </div>
                        <div class="flex">
                            <div class="price"><span>$</span>{{ $food->price }}</div>
                            <input type="number" name="qty" class="qty" min="1" max="99"
                                value="1" maxlength="2">
                        </div>
                        <button type="submit" name="add_to_cart" class="cart-btn">add to cart</button>
                    </form>
                </div>
            </div>
        @else
            <p class="empty">no products added yet!</p>
        @endif


    </section>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <!-- custom js file link  -->
 @endsection