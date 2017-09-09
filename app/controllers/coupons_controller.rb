class CouponsController < ApplicationController
  before_action :set_cart_data, only: [:apply, :cancel_coupon]

  # This method apply coupon
  def apply
    @coupon = @cart.coupon
    if params.has_key?(:using_brownie_point)
      @cart = @cart.set_brownie_point_usage(params[:using_brownie_point])
    end
    if params.has_key?(:coupon) || @coupon
      @coupon ||= Coupon.find_by_code(params[:coupon])
      if @coupon && @coupon.is_applicable?(@cart_data)
        @cart.coupon_id = @coupon.id
        @cart.save!
        cashback_discount_hash = @cart.get_cashback_discount_hash(@cart_data)
        @cashback, @discount = cashback_discount_hash[:cashback], cashback_discount_hash[:discount]
      end
    end
    @cart_data = current_user.get_cart_data_for_brownie_point(@cart, @cart_data) if current_user.is_using_brownie_point?(@cart)
    @grand_total = Cart.get_cart_total(@cart_data)
  end

  # This method cancel coupon
  def cancel_coupon
    @coupon = @cart.coupon
    @cart.coupon_id = nil
    @cart.save!
    @discount = Cart.get_discount(@cart_data, Coupon.get_offer_type[:discount_amount])
    @cart_data = current_user.get_cart_data_for_brownie_point(@cart, @cart_data) if current_user.is_using_brownie_point?(@cart)
    @grand_total = Cart.get_cart_total(@cart_data)
  end
end
