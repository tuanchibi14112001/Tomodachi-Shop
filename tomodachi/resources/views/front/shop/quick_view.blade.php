@extends('front.master')
@section('title', 'Quick View')
@section('body')
    <section class="quick-view">

        <h1 class="title">quick view</h1>
        @if ($food != null)
            <div class="qv-food-all">
                <div class="image">
                    <img class="food-image" src="uploads/{{ $food->url }} " alt="">
                </div>
                <div class="food-info">
                    <form action="" method="post" class="box" class="qv-food-info">
                        <input type="hidden" name="pid" value="{{ $food->id }} ">
                        <input type="hidden" name="name" value="{{ $food->name }} ">
                        <input type="hidden" name="price" value="{{ $food->price }} ">
                        <input type="hidden" name="image" value="{{ $food->url }} ">
                        <input type="hidden" name="qty_remain" value=" {{ $food->quantity }}">
                        {{ csrf_field() }}
                        <a href="/shop/menu#{{ $food->category['id'] }}" class="cat">{{ $food->category->name }} </a>
                        <div class="name">{{ $food->name }} </div>
                        <p class="descript">{{ $food->description }}</p>
                        <div class="flex">

                            <div class="price"><span>$</span>{{ $food->price }}</div>
                            @if ($food->quantity > 0)
                                <input type="number" name="qty" class="qty" min="1"
                                    max="{{ $food->quantity }}" value="1" maxlength="2">
                            @endif
                        </div>
                        @if ($food->quantity > 0)
                        <p style="font-size: 1.8rem; margin-bottom: 20px" class="empty">quantity: {{ $food->quantity }}</p>
                        @endif
                        @if ($food->quantity > 0)
                            <button  class="add-to-cart cart-btn">Add To Cart</button>
                        @else
                            <p class="empty">out of stock</p>
                        @endif

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
