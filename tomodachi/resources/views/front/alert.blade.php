@if ($errors->any())
    <div class="alert alert-danger">
        <ul style="list-style-type: none;">
            @foreach ($errors->all() as $error)
                <li style="font-size:18px; color:red;">{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif