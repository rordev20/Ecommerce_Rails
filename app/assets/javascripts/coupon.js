var CouponUtil = {
  removeDiscountSection: function(){
    $('#discount_section').next('hr').remove();
    $('#discount_section').remove();
  }
}