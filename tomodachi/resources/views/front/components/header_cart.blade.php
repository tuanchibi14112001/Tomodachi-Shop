<script src="front/js/addtocart_script.js"></script>
<!--end container -->


<div class="cart_container">
    <div class="shopping-cart">

        <!--end shopping-cart-header -->
        @if (isset($carts))
            <ul class="shopping-cart-items">

                @foreach ($carts as $cart)
                    <li class="clearfix">
                        <div class="cart_item">
                            <div class="cart_item_image">
                                <img src="uploads/{{ $cart->options->image }}" alt="item1" />
                            </div>
                            <div class="cart_item_info">
                                <span class="item-name"><b>{{ $cart->name }}</b></span>
                                <span class="item-price">${{ $cart->price }}</span>
                                <input id="{{ $cart->id }}" type="number" name="qty"
                                    class="qty item-quantity qty_oncart_header" min="1"
                                    max="{{ $cart->options->max_qty }}" value="{{ $cart->qty }}"
                                    rowId="{{ $cart->rowId }}" maxlength="2">
                            </div>
                            <div class="delete_btn">
                                <a href="/cart/delete/{{ $cart->rowId }}" style="text-align: center"><i
                                        class="header-delete-cart fas fa-times"></i></a>
                            </div>
                        </div>

                    </li>
                @endforeach







            </ul>
            <div class="shopping-cart-header">
                <div class="shopping-cart-total">
                    <span class="lighter-text">Total:</span>
                    <span id="header-total-price" class="main-color-text">${{ $cart_total }}</span>
                </div>
            </div>
            <a href="{{ route('cart.index') }}" class="checkout_button">View cart</a>
            <a href="{{ route('checkout') }}" class="checkout_button">Checkout</a>
        @else
            <p>Cart is empty!</p>
        @endif
    </div>
    <!--end shopping-cart -->
