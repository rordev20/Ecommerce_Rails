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
  }
}

$(document).on("click", "#same_address", function(event) {
  CartUtil.showShipAddress($(this));
});

$(document).ready(function () {
  // write all fuction which need to be call on page load here
});
