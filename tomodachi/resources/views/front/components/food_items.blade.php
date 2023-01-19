<form action="" method="post" class="box">
    <input type="hidden" name="pid" value="{{ $food_item->id }}">
    <input type="hidden" name="name" value=" {{ $food_item->name }}">
    <input type="hidden" name="price" value=" {{ $food_item->price }}">
    <input type="hidden" name="image" value=" {{ $food_item->url }}">
    <a href="/shop/quick_view/food_id={{ $food_item->id }}" class="fas fa-eye"></a>
    <button type="submit" class="fas fa-shopping-cart" name="add_to_cart"></button>
    <img src="uploads/images/{{ $food_item->url }}" alt="">
    <a href="/shop/menu/{{ $food_item->category['id'] }}" class="cat">
        {{ $food_item->category['name'] }}</a>
    <div class="name"> {{ $food_item->name }}</div>
    <div class="flex">
        <div class="price"><span>$</span> {{ $food_item->price }}</div>
        <input type="number" name="qty" class="qty" min="1" max="99" value="1" maxlength="2">
    </div>
</form>