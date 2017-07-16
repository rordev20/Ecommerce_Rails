var CartUtil = {
  // This method show hide shipping address
  showShipAddress: function(that) {
    var element = $('.ship_address_fields');
    var checkbox_value = parseInt(that.val());
    if (checkbox_value == 1) {
      that.val(0);
      element.removeClass('hidden');
    }
    else {
      that.val(1);
      element.addClass('hidden');
    }
  },
  // This method toggle for brown point usage
  browniePointToggle: function(){
    var using_brownie_point = $('#using_brownie_points').val();
    $.ajax({
      method: "POST",
      url: "/coupons/apply",
      data: { using_brownie_point: using_brownie_point },
      dataType: "script"
    });
  },
  increaseQuantity: function(data){
    var item_id = CartUtil.getItemIDFromData(data)
    var url = '/cart_items/' + item_id + '/increase_quantity';
    $.ajax({
      method: "POST",
      url: url,
      dataType: "script"
    });
  },
  decreaseQuantity: function(data){
    var item_id = CartUtil.getItemIDFromData(data)
    var item_qty = CartUtil.getItemQty(data);
    var cart_item_id = CartUtil.getCartItemIdFromData(data);
    var single_qty = item_qty == 1;
    var url = single_qty ? "/cart_items/" + cart_item_id : '/cart_items/' + item_id + '/decrease_quantity';
    var request_type = single_qty ? "DELETE" : "POST";
    $.ajax({
      method: request_type,
      url: url,
      dataType: "script"
    });
  },
  getItemIDFromData: function(data){
    return CartUtil.getCartItemObj(data).data('item-id');
  },
  getItemQty: function(data){
    return CartUtil.getCartItemObj(data).data('item-qty');
  },
  getCartItemIdFromData: function(data){
    return CartUtil.getCartItemObj(data).data('cart-item-id');
  },
  getCartItemObj: function(data) {
    return data.parent().siblings('input[name=item_count]'); 
  },
  setItemQtyAndItemTotal: function(cart_items_data){
    var cart_item_data_obj = JSON.parse(cart_items_data);
    $.each( cart_item_data_obj, function( key, cart_item_data ) {
      $(cart_item_data['item_total_selector']).html(cart_item_data['item_total'])
      $(cart_item_data['item_qty_selector']).data('item-qty', cart_item_data['item_qty']);
    });
  }
}

$(document).on("click", "#same_address", function(event) {
  CartUtil.showShipAddress($(this));
});

$(document).on("click", "#using_brownie_points", function(event) {
  CartUtil.browniePointToggle();
});

$(document).on("click", ".bootstrap-touchspin-up", function(event) {
  CartUtil.increaseQuantity($(this));
});

$(document).on("click", ".bootstrap-touchspin-down", function(event) {
  CartUtil.decreaseQuantity($(this));
});

$(document).ready(function () {
  // write all fuction which need to be call on page load here
});
