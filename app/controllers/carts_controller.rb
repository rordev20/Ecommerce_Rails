class CartsController < ApplicationController
  before_action :set_cart_data, only: [:show]
  before_action :get_category_list

  #This method show cart page
  def show
    @cart_items = @cart.items_in_cart
    @coupon = @cart.coupon
    cashback_discount_hash = @cart.get_cashback_discount_hash(@cart_data)
    @cashback, @discount = cashback_discount_hash[:cashback], cashback_discount_hash[:discount]
    @cart_data = current_user.get_cart_data_for_brownie_point(@cart, @cart_data) if current_user.is_using_brownie_point?(@cart)
    @grand_total = Cart.get_cart_total(@cart_data)
  end

end
