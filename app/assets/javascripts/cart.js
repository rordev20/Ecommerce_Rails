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
    var url = '/cart_items/' + item_id + '/decrease_quantity';
    $.ajax({
      method: "POST",
      url: url,
      dataType: "script"
    });
  },
  getItemIDFromData: function(data){
    return data.parent().siblings('input[name=item_count]').data('item-id');
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
