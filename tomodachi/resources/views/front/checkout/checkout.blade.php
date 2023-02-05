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

            @if ($total > 0)
                <div class="user-info">
                    <h3>Note</h3>
                    <div><i class="fas fa-edit"></i>
                        <textarea name="note" form="checkout_form" class="order-note" placeholder="Note for cheef"></textarea>
                    </div>
                    <h3>your info</h3>
                    <p><i class="fas fa-user"></i><input required type="text"
                            name="name"value="{{ old('name') ? old('name') : $customer->name }}" /></p>
                    @if ($errors->has('name'))
                        <p style="color: red; font-size:14px">{{ $errors->first('name') }}</p>
                    @endif
                    <p><i class="fas fa-phone"></i><input required type="text" name="phone"
                            value=" {{ old('phone') ? old('phone') : $customer->phone_num }}" />
                    </p>
                    @if ($errors->has('phone'))
                        <p style="color: red; font-size:14px">{{ $errors->first('phone') }}</p>
                    @endif
                    <p><i class="fas fa-envelope"></i><input required type="text" name="mail"
                            value="{{ old('mail') ? old('mail') : $customer->user->email }}" />
                    </p>
                    @if ($errors->has('mail'))
                        <p style="color: red; font-size:14px">{{ $errors->first('mail') }}</p>
                    @endif
                    <h3>delivery address</h3>
                    <p><i class="fas fa-map-marker-alt"></i><input required
                            value="{{ old('address') ? old('address') : $customer->address }}" type="text"
                            name="address" /></p>
                    @if ($errors->has('address'))
                        <p style="color: red; font-size:14px">{{ $errors->first('address') }}</p>
                    @endif
                    <a href="{{ url('profile/update_profile?cs_id=' . $customer->id) }}" class="btn">update info</a>

                    <p><i class="fas fa-dollar-sign"></i><select name="method" class="box payment_select" required>
                            <option value="" disabled selected>select payment method --</option>
                            <option value="cash on delivery">cash on delivery</option>
                        </select>
                    </p>
                    @php
                        $disable = 0;
                        if ($customer->address == null || $customer->phone_num == null || $customer->name == null) {
                            $disable = 1;
                        }
                    @endphp

                </div>
                @if (!$disable)
                    <input type="submit" value="place order" class="btn"
                        style="width:100%; background:var(--red); color:var(--white);" name="submit">
                @else
                    <p class="empty">Please update info before checkout</p>
                @endif
            @endif
        </form>

    </section>
@endsection
