<form action="" method="post" class="box">
    <input type="hidden" name="pid" value="{{ $food_item->id }}">
    <input type="hidden" name="name" value=" {{ $food_item->name }}">
    <input type="hidden" name="price" value=" {{ $food_item->price }}">
    <input type="hidden" name="image" value=" {{ $food_item->url }}">
    <input type="hidden" name="qty_remain" value=" {{ $food_item->quantity }}">
    {{ csrf_field() }}
    <a href="/shop/quick_view/food_id={{ $food_item->id }}" class="fas fa-eye"></a>
    <a href="" class="add-to-cart fas fa-shopping-cart"></a>
    <img src="uploads/{{ $food_item->url }}" alt="">
    <a href="/shop/menu/{{ $food_item->category['id'] }}" class="cat">
        {{ $food_item->category['name'] }}</a>
    <div class="name"> {{ $food_item->name }}</div>
    <div class="flex">
        <div class="price"><span>$</span> {{ $food_item->price }}</div>
        @if ($food_item->quantity > 0)
            <input type="number" name="qty" class="qty" min="1" max="{{ $food_item->quantity }}"
                value="1" maxlength="2">
        @else
            <p style="color: red; font-size: 16px
            ">out of stock</p>
        @endif
    </div>
</form>
