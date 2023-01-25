@extends('front.master')
@section('title', 'Check out')
@section('body')
    <div class="heading">
        <h3>checkout</h3>
        <p><a href="/">home</a> <span> / checkout</span></p>
    </div>

    <section class="checkout">

        <h1 class="title">order summary</h1>

        <form action="{{ route('checkout.submit') }}" name="checkout_form" id="checkout_form" method="post">
            @csrf

            <div class="cart-items">
                <h3>cart items</h3>

                @if ($total > 0)
                    @foreach ($carts as $cart)
                        <p><span class="name">{{ $cart->name }}</span><span class="price">
                                ${{ $cart->price }} x {{ $cart->qty }}</span></p>
                    @endforeach
                @else
                    echo '<p class="empty">your cart is empty!</p>';
                @endif

                <p class="grand-total"><span class="name">grand total :</span><span
                        class="price">${{ $total }}</span></p>
                <a href="{{ route('cart.index') }}" class="btn">veiw cart</a>
            </div>

            {{-- <input type="hidden" name="total_products" value="<?= $total_products ?>">
            <input type="hidden" name="total_price" value="<?= $grand_total ?>" value="">
            <input type="hidden" name="name" value="<?= $fetch_profile['name'] ?>">
            <input type="hidden" name="number" value="<?= $fetch_profile['number'] ?>">
            <input type="hidden" name="email" value="<?= $fetch_profile['email'] ?>">
            <input type="hidden" name="address" value="<?= $fetch_profile['address'] ?>"> --}}
            @if ($total > 0)
                <div class="user-info">
                    <h3>Note</h3>
                    <div><i class="fas fa-edit"></i>
                        <textarea name="note" form="checkout_form" class="order-note" placeholder="Note for cheef"></textarea>
                    </div>
                    <h3>your info</h3>
                    <p><i class="fas fa-user"></i><input type="text" name="name"value="{{ $customer->name }}" /></p>
                    <p><i class="fas fa-phone"></i><input type="text" name="phone"
                            value=" {{ $customer->phone_num }}" />
                    </p>
                    <p><i class="fas fa-envelope"></i><input type="text" name="mail" value="{{ $customer->mail }}" />
                    </p>
                    {{-- <a href="" class="btn">update info</a> --}}
                    <h3>delivery address</h3>
                    <p><i class="fas fa-map-marker-alt"></i><input type="text" name="address"
                            value="{{ $customer->address }}" /></p>
                    {{-- <a href="" class="btn">update address</a> --}}
                    <p><i class="fas fa-dollar-sign"></i><select name="method" class="box payment_select" required>
                            <option value="" disabled selected>select payment method --</option>
                            <option value="cash on delivery">cash on delivery</option>
                            <option value="credit card">credit card</option>
                            <option value="paytm">paytm</option>
                            <option value="paypal">paypal</option>
                        </select>
                    </p>

                </div>
                <input type="submit" value="place order" class="btn"
                    style="width:100%; background:var(--red); color:var(--white);" name="submit">
            @endif
        </form>

    </section>
@endsection
