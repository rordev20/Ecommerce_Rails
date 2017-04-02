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
        @cart_data = @coupon.get_cart_data_for_coupon(@cart_data, @cart)
        @coupon.use_count += 1
        @cart.coupon_id = @coupon.id
        @coupon.save!
        @cart.save!
        if @coupon && @coupon.is_cashback_coupon?
          discount_type = Coupon.get_offer_type[:cashback]
          @cashback = Cart.get_discount(@cart_data, discount_type)
        elsif @coupon
          discount_type = Coupon.get_offer_type[:discount_amount]
          @discount = Cart.get_discount(@cart_data, discount_type)
        end
      end
    end
    @discount ||= 0
    @cart_data = current_user.get_cart_data_for_brownie_point(@cart, @cart_data) if current_user.is_using_brownie_point?(@cart)
    @grand_total = Cart.get_cart_total(@cart_data)
  end

  # This method cancel coupon
  def cancel_coupon
    @coupon = @cart.coupon
    @coupon.use_count = @coupon.use_count - 1
    @cart.coupon_id = nil
    @coupon.save!
    @cart.save!
    @discount = Cart.get_discount(@cart_data, Coupon.get_offer_type[:discount_amount])
    @cart_data = current_user.get_cart_data_for_brownie_point(@cart, @cart_data) if current_user.is_using_brownie_point?(@cart)
    @grand_total = Cart.get_cart_total(@cart_data)
  end
end
