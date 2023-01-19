@extends('front.master')
@section('title', 'MENU')
@section('body')
    <?php
    $db_name = 'mysql:host=localhost;dbname=food_db';
    $user_name = 'root';
    $user_password = '';
    $conn = new PDO($db_name, $user_name, $user_password);
    ?>
    <style>
    </style>

    <div class="header">
        <nav class="nav">
            <div class="container">
                <ul>
                    @foreach ($categories as $category)
                        <li class="{{ request()->segment(3) == $category->id ? 'active' : '' }}"><a
                                href="/shop/menu/{{ $category->id }}#{{ $category->id }}">{{ $category->name }}</a></li>
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
            @foreach ($foods as $food)
                @if ($food->cate_id == $category->id)
                    
                        <form action="" method="post" class="box">
                            <form action="" method="post" class="box">
                                <input type="hidden" name="pid" value="{{ $food->id }}">
                                <input type="hidden" name="name" value=" {{ $food->name }}">
                                <input type="hidden" name="price" value=" {{ $food->price }}">
                                <input type="hidden" name="image" value=" {{ $food->url }}">
                                <a href="/shop/quick_view/food_id={{ $food->id }}" class="fas fa-eye"></a>
                                <button type="submit" class="fas fa-shopping-cart" name="add_to_cart"></button>
                                <img src="uploads/{{ $food->url }}" alt="">
                                <a href="category.php?category= {{ $food->category['name'] }}" class="cat">
                                    {{ $food->category['name'] }}</a>
                                <div class="name"> {{ $food->name }}</div>
                                <div class="flex">
                                    <div class="price"><span>$</span> {{ $food->price }}</div>
                                    <input type="number" name="qty" class="qty" min="1" max="99"
                                        value="1" maxlength="2">
                                </div>
                            </form>
                        </form>

                    
                @endif
            @endforeach
         </div>           

        </section>
    @endforeach

    <script>
        const sections = document.querySelectorAll(".section");
        const navLi = document.querySelectorAll(".nav .container ul li");
        window.addEventListener("scroll", () => {
            let current = "";
            sections.forEach((section) => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (pageYOffset >= sectionTop - sectionHeight / 3) {
                    current = section.getAttribute("id");
                    console.log(current);
                }
            });
            navLi.forEach((li) => {
                li.classList.remove("active");
                if (li.classList.contains(current)) {
                    li.classList.add("active");
                }
            });
        });
    </script>
@endsection
