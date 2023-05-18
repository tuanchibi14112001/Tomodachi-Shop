// let cart = document.getElementsByClassName("show-cart");
// document
//     .getElementsByClassName("show-cart")
//     .addEventListener("click", function (e) {
//         console.log("check");
//         e.preventDefault();
//         $(".shopping-cart").fadeToggle("fast");
//     });

$(document).ready(function () {
    $(".qty_oncart_header").change(function (e) {
        const rowId = $(this).attr("rowId");
        const newVal = $(this).val();
        updateHeaderCart(rowId, newVal, $(this).parent().parent());
    });
});
function updateHeaderCart(rowId, newVal, parent) {
    $.ajax({
        type: "get",
        url: "/cart/update",
        data: {
            rowId: rowId,
            qty: newVal,
        },
        success: function (respone) {
            $(".icons a span").html("(" + respone.count + ")");
            $("#header-total-price").html("$" + respone.total_price);

            //location.reload();
            // $(".left_nav").reload();
        },
        error: function () {
            alert("Update fail");
            console.log(error);
        },
    });
}
