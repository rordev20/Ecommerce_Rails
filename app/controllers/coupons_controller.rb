class CouponsController < ApplicationController
  before_action :current_cart, only: [:apply]
  before_action :create_cart_data, only: [:apply]

  def apply
    @coupon = Coupon.find_by_code(params[:coupon])
    @cart_data = @coupon.get_cart_data_for_coupon(@cart_data, @cart)
    @discount = Cart.get_discount(@cart_data)
  end
end
