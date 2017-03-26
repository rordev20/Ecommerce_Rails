class CouponsController < ApplicationController
  before_action :current_cart, only: [:apply]
  before_action :create_cart_data, only: [:apply]

  def apply
    @sub_total = Cart.get_cart_total(@cart_data)
    if params[:cancel_coupon].present?
      @cart.coupon_id = nil
      @cart.save!
    elsif params[:coupon].present?
      @coupon = Coupon.find_by_code(params[:coupon])
      @cart_data = @coupon.get_cart_data_for_coupon(@cart_data, @cart)
      @cart.coupon_id = @coupon.id
      @cart.save!
    end
    @discount = Cart.get_discount(@cart_data)
    @grand_total = @sub_total - @discount
  end
end
