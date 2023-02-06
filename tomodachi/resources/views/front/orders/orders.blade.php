@extends('front.master')
@section('title', 'Orders')
@section('body')
    @if (isset($message) && $message != null)
        <script>
            $(document).ready(function() {
                alert("{{ $message }}");
            });
        </script>
    @endif
    <div class="heading">
        <h3>orders</h3>
        <p><a href="html.php">home</a> <span> / orders</span></p>
    </div>

    <section class="orders">

        <h1 class="title">your orders</h1>

        <div class="box-container">



            @if ($orders->count() > 0)
                @foreach ($orders as $order)
                    <div class="box">
                        <p>placed on : <span>{{ $order->created_at }}</span></p>
                        <p>name : <span>{{ $order->address->name }}</span></p>
                        <p>email : <span>{{ $order->address->email }}</span></p>
                        <p>number : <span>{{ $order->address->phone }}</span></p>
                        <p>address : <span>{{ $order->address->address }}</span></p>
                        {{-- <p>payment method : <span><?= $fetch_orders['method'] ?></span></p> --}}
                        <p>your orders :
                        <ul style="list-style: none;font-size:2rem">
                            @foreach ($order->order_detail as $order_detail)
                                <li>{{ $order_detail->food_item->name }} : {{ $order_detail->quantity }}</li>
                            @endforeach
                        </ul>
                        </p>
                        <p>note : <span>{{ $order->note }}</span></p>
                        <p>total price : <span>${{ $order->total_price }}</span></p>

                        @switch($order->status)
                            @case(0)
                                <p>stauts : <span style="color:gray;">pending</span></p>
                            @break

                            @case(1)
                                <p>stauts : <span style="color:green;">success</span></p>
                            @break

                            @case(2)
                                <p>stauts : <span style="color:red;">cancel</span></p>
                            @break

                            @default
                            @break
                        @endswitch
                    </div>
                @endforeach
            @else
                <p class="empty">no orders placed yet!</p>
            @endif

        </div>

    </section>
@endsection
