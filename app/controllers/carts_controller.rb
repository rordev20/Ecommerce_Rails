class CartsController < ApplicationController
  before_action :set_cart_data, only: [:show]

  #This method show cart page
  def show
    @cart_items = @cart.items_in_cart
    @coupon = @cart.coupon
    if @coupon
      @cart_data = @coupon.get_cart_data_for_coupon(@cart_data, @cart)
      discount_type = @coupon.is_cashback_coupon? ? Coupon.get_offer_type[:cashback] : Coupon.get_offer_type[:discount_amount]
    end
    if @coupon && @coupon.is_cashback_coupon?
      @cashback = Cart.get_discount(@cart_data, discount_type)
    elsif @coupon
      @discount = Cart.get_discount(@cart_data, discount_type)
    end
    @discount ||= 0
    @grand_total = Cart.get_grand_total(@sub_total, @discount)
  end

end
