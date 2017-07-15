var CouponUtil = {
  removeDiscountSection: function(){
    $('#discount_section').remove();
    $('#total_section').next('hr').remove();
  }
}