class CartsController < ApplicationController
  before_action :set_cart_data, only: [:show]
  before_action :get_category_list

  #This method show cart page
  def show
    @cart_items = @cart.items_in_cart
    @coupon = @cart.coupon
    if @coupon
      @cart_data = @coupon.get_cart_data_for_coupon(@cart_data, @cart)
      discount_type = @coupon.is_cashback_coupon? ? Coupon.get_offer_type[:cashback] : Coupon.get_offer_type[:discount_amount]
      @discount = Cart.get_discount(@cart_data, discount_type)
    end
    @cashback = Cart.get_discount(@cart_data, discount_type) if @coupon && @coupon.is_cashback_coupon?
    @discount ||= 0
    @cart_data = current_user.get_cart_data_for_brownie_point(@cart, @cart_data) if current_user.is_using_brownie_point?(@cart)
    @grand_total = Cart.get_cart_total(@cart_data)
  end

end
