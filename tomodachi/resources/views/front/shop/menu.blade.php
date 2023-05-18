@extends('front.master')
@section('title', 'MENU')
@section('body')

    <div class="header2">
        <nav class="nav">
            <div class="container">
                <ul id="mainNav">
                    @foreach ($categories as $category)
                        <li class="nav-link" id="nav{{ $category->id }}"><a
                                href="/shop/menu#{{ $category->id }}">{{ strtolower($category->name) }}</a></li>
                    @endforeach
                </ul>
            </div>
        </nav>
    </div>
    <div class="heading">
        <h3>our menu</h3>
        <p><a href={{ url('/') }}>home</a> <span> / menu</span></p>
    </div>

    <!-- menu section starts  -->
    @foreach ($categories as $category)
        <section class=" section products" id="{{ $category->id }}">
            <h1 style="margin-bottom: 30px; font-size: large;text-transform: uppercase;">{{ $category->name }}</h1>
            <div class="box-container">
                @if ($category->FoodItems()->count() > 0)
                    @foreach ($category->FoodItems as $food)
                        @include('front.components.food_items', ['food_item' => $food])
                    @endforeach
                @else
                    <p class="empty">Don't have any food</p>
                @endif
            </div>

        </section>
    @endforeach

    <script>
        $(document).ready(function() {
            var
                topMenu = $("#mainNav"),
                topMenuHeight = topMenu.outerHeight() + 1,
                // All list items
                menuItems = topMenu.find("li"),
                // Anchors corresponding to menu items
                scrollItems = menuItems.map(function() {
                    var id = $(this).attr('id');
                    id = id.substring(3);
                    var item = $('#' + id);
                    if (item.length) {
                        return item;
                    }
                });
            //console.log(scrollItems);

            $(window).scroll(function() {
                // Get container scroll position
                var fromTop = $(this).scrollTop() + topMenuHeight;

                // Get id of current scroll item
                var cur = scrollItems.map(function() {
                    if ($(this).offset().top < fromTop + 200)
                        return this;
                });
                // Get the id of the current element
                cur = cur[cur.length - 1];
                var id = cur && cur.length ? cur[0].id : "";
                // console.log(id);
                if (id != "") {
                    $('.active').removeClass('active');
                    $('#nav' + id).addClass('active');
                }

            });


            let segment = window.location.hash;
            segment = segment.substring(1);
            //console.log(segment);
            ($('#nav' + segment)).addClass('active');
            $('.nav-link a').click(function() {
                //console.log(segment);
                $('.active').removeClass('active');
                $(this).parent().addClass('active');
            });
        });
    </script>
@endsection
