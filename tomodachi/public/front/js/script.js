navbar = document.querySelector(".header .flex .navbar");

document.querySelector("#menu-btn").onclick = () => {
    navbar.classList.toggle("active");
    profile.classList.remove("active");
};

profile = document.querySelector(".header .flex .profile");

document.querySelector("#user-btn").onclick = () => {
    profile.classList.toggle("active");
    navbar.classList.remove("active");
};

window.onscroll = () => {
    navbar.classList.remove("active");
    profile.classList.remove("active");
};

function loader() {
    document.querySelector(".loader").style.display = "none";
}

function fadeOut() {
    setInterval(loader, 2000);
}

window.onload = fadeOut;

document.querySelectorAll('input[type="number"]').forEach((numberInput) => {
    numberInput.oninput = () => {
        if (numberInput.value.length > numberInput.maxLength)
            numberInput.value = numberInput.value.slice(
                0,
                numberInput.maxLength
            );
    };
});
$(document).ready(function () {
    $(".show-cart").click(function (e) {
        //console.log("check");
        e.preventDefault();
        $(".shopping-cart").fadeToggle("fast");
        $(".shopping-cart").css("background-color");
    });
    $(".add-to-cart").click(function (e) {
        e.preventDefault();
        const form = $(this).parent();
        const pid = form.find('input[name="pid"]').val();
        const name = form.find('input[name="name"]').val();
        const price = form.find('input[name="price"]').val();
        const image = form.find('input[name="image"]').val();
        const remain_qty = form.find('input[name="qty_remain"]').val();
        const qty = form.find(".qty").val();
        const req_data = {
            pid: pid,
            name: name,
            price: price,
            image: image,
            qty: qty,
        };
        //console.log(req_data);
        if (qty === undefined) alert("out of stock");
        else {
            let qty_oncart = $("#" + pid).val();
            if (qty_oncart === undefined) qty_oncart = 0;
            if (Number(qty) + Number(qty_oncart) > Number(remain_qty)) {
                alert("out of stock");
            } else addToCart(req_data);
        }
        //cart = document.getElementsByClassName("show-cart");
    });
    //cart quantity change
    $(".qty_oncart").change(function (e) {
        const rowId = $(this).attr("rowId");
        const newVal = $(this).val();
        updateCart(rowId, newVal, $(this).parent().parent());
    });
});
function addToCart(req_data) {
    $.ajax({
        type: "get",
        url: "/cart/add",
        data: req_data,
        success: function (respone) {
            //console.log(respone);

            //location.reload();
            $(".icons a span").html("(" + respone.count + ")");
            $(".left_nav").html(respone.view);
            showPopup("Successfully added to cart");
        },
        error: function () {
            alert("Update fail");
            console.log(error);
        },
    });
}
function updateCart(rowId, newVal, parent) {
    $.ajax({
        type: "get",
        url: "/cart/update",
        data: {
            rowId: rowId,
            qty: newVal,
        },
        success: function (respone) {
            $subtotal = parent.find(".sub-total span");
            $subtotal.html("$" + respone.sub_total);
            $(".cart-total span").html("$" + respone.total_price);
            $(".icons a span").html("(" + respone.count + ")");

            //location.reload();
            // $(".left_nav").reload();
        },
        error: function () {
            alert("Update fail");
            console.log(error);
        },
    });
}

function showPopup(msg){
    $(".food-up-mess p").html(msg);
    $(".food-up-mess").show();    
    setTimeout(function() {
        $(".food-up-mess").hide();
    }, 1000);
}