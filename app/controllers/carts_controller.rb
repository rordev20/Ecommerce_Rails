class CartsController < ApplicationController
  before_action :current_cart, only: [:show]

  #This method show cart page
  def show
    create_cart_data
    @cart_items = @cart.items_in_cart
    @sub_total = Cart.get_cart_total(@cart_data)
    @coupon = @cart.coupon
    if @coupon.present?
      @cart_data = @coupon.get_cart_data_for_coupon(@cart_data, @cart)
    end
    @discount = Cart.get_discount(@cart_data)
    @grand_total = @sub_total - @discount
  end

end
