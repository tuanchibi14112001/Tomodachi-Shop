@extends('front.master')
@section('title', 'Search')
@section('body')
    <section class="search-form">
        <form method="post" action="{{ route('search.submit') }}">
            @csrf
            @if(isset($name))
            <input type="text" name="search_box" placeholder="search here..." value="{{ $name }}" class="box">
            @else
            <input type="text" name="search_box" placeholder="search here..." value="" class="box">
            @endif
            <button type="submit" name="search_btn" class="fas fa-search"></button>
        </form>
    </section>

    <!-- search form section ends -->


    <section class="products" style="min-height: 100vh; padding-top:0;">

        <div class="box-container">
            @if ($foods->count() > 0)
                @foreach ($foods as $food)
                    @include('front.components.food_items', ['food_item' => $food])
                @endforeach
            @else
                <p class="empty">Don't have any food</p>
            @endif

        </div>

    </section>

    <!-- custom js file link  -->
@endsection
