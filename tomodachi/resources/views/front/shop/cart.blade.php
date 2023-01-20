@extends('front.master')
@section('title', 'Cart')
@section('body')
    <div class="heading">
        <h3>shopping cart</h3>
    </div>

    <!-- shopping cart section starts  -->

    <section class="products">

        <h1 class="title">your cart</h1>

        <div class="box-container">

            @if ($count > 0)
                @foreach ($carts as $cart)
                    <form action="" method="post" class="box">
                        {{-- <input type="hidden" name="cart_id" value="<?= $fetch_cart['id'] ?>"> --}}
                        {{-- <a href="quick_view.php?pid=<?= $fetch_cart['pid'] ?>" class="fas fa-eye"></a> --}}
                        <button type="submit" class="fas fa-times" name="delete"
                            onclick="return confirm('delete this item?');"></button>
                        <img src="\uploads\{{ $cart->options->image }}" alt="">
                        <div class="name">{{ $cart->name }}</div>
                        <div class="flex">
                            <div class="price">${{ $cart->price }}</div>
                            <input type="number" name="qty" class="qty" min="1" max="99"
                                value="{{ $cart->qty }}" maxlength="2">
                            <button type="submit" class="fas fa-edit" name="update_qty"></button>
                        </div>
                        <div class="sub-total"> sub total :
                            <span>${{ $cart->qty * $cart->price }}</span>
                        </div>
                    </form>
                @endforeach
            @else
                <p class="empty">your cart is empty</p>
            @endif


        </div>
        <div class="cart-total">
            <p>cart total : <span>${{ $total }}</span></p>
            <a href="" class="btn <?= $count > 1 ? '' : 'disabled' ?>">proceed to checkout</a>
        </div>

        <div class="more-btn">
            <form action="" method="post">
                <button type="submit" class="delete-btn <?= $count > 1 ? '' : 'disabled' ?>" name="delete_all"
                    onclick="return confirm('delete all from cart?');">delete all</button>
            </form>
            <a href="menu.php" class="btn">continue shopping</a>
        </div>

    </section>
@endsection
