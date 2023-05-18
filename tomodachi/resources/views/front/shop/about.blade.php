@extends('front.master')
@section('title', 'About')
@section('body')
    <!-- header section ends -->

    <div class="heading">
        <h3>about us</h3>
        <p><a href="home.php">home</a> <span> / about</span></p>
    </div>

    <!-- about section starts  -->

    <section class="about">

        <div class="row">

            <div class="image">
                <img src="front/images/about-img.svg" alt="">
            </div>

            <div class="content">
                <h3>why choose us?</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Deserunt, neque debitis incidunt qui ipsum sed
                    doloremque a molestiae in veritatis ullam similique sunt aliquam dolores dolore? Quasi atque debitis
                    nobis!</p>
                <a href="/shop/menu" class="btn">our menu</a>
            </div>

        </div>

    </section>

    <!-- about section ends -->

    <!-- steps section starts  -->

    <section class="steps">

        <h1 class="title">simple steps</h1>

        <div class="box-container">

            <div class="box">
                <img src="front/images/step-1.png" alt="">
                <h3>choose order</h3>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nesciunt, dolorem.</p>
            </div>

            <div class="box">
                <img src="front/images/step-2.png" alt="">
                <h3>fast delivery</h3>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nesciunt, dolorem.</p>
            </div>

            <div class="box">
                <img src="front/images/step-3.png" alt="">
                <h3>enjoy food</h3>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nesciunt, dolorem.</p>
            </div>

        </div>

    </section>

    <!-- steps section ends -->

    <!-- reviews section starts  -->

    <section class="reviews">

        <h1 class="title">customer's reivews</h1>

        <div class="swiper reviews-slider">

            <div class="swiper-wrapper">

                <div class="swiper-slide slide">
                    <img src="front/images/pic-1.png" alt="">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos voluptate eligendi laborum molestias ut
                        earum nulla sint voluptatum labore nemo.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>john deo</h3>
                </div>

                <div class="swiper-slide slide">
                    <img src="front/images/pic-2.png" alt="">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos voluptate eligendi laborum molestias ut
                        earum nulla sint voluptatum labore nemo.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>john deo</h3>
                </div>

                <div class="swiper-slide slide">
                    <img src="front/images/pic-3.png" alt="">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos voluptate eligendi laborum molestias ut
                        earum nulla sint voluptatum labore nemo.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>john deo</h3>
                </div>

                <div class="swiper-slide slide">
                    <img src="front/images/pic-4.png" alt="">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos voluptate eligendi laborum molestias ut
                        earum nulla sint voluptatum labore nemo.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>john deo</h3>
                </div>

                <div class="swiper-slide slide">
                    <img src="front/images/pic-5.png" alt="">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos voluptate eligendi laborum molestias ut
                        earum nulla sint voluptatum labore nemo.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>john deo</h3>
                </div>

                <div class="swiper-slide slide">
                    <img src="front/images/pic-6.png" alt="">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos voluptate eligendi laborum molestias ut
                        earum nulla sint voluptatum labore nemo.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>john deo</h3>
                </div>

            </div>

            <div class="swiper-pagination"></div>

        </div>

    </section>

    <!-- reviews section ends -->

    <!-- footer section starts  -->


    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <!-- custom js file link  -->

    <script>
        var swiper = new Swiper(".reviews-slider", {
            loop: true,
            grabCursor: true,
            spaceBetween: 20,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                },
                700: {
                    slidesPerView: 2,
                },
                1024: {
                    slidesPerView: 3,
                },
            },
        });
    </script>
@endsection
