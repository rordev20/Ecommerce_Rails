class CouponsController < ApplicationController
  before_action :set_cart_data, only: [:apply, :cancel_coupon]

  def apply
    @coupon = Coupon.find_by_code(params[:coupon])
    @cart_data = @coupon.get_cart_data_for_coupon(@cart_data, @cart)
    @coupon.use_count += 1
    @cart.coupon_id = @coupon.id
    @coupon.save!
    @cart.save!
    if @coupon.is_cashback_coupon?
      discount_type = Coupon.get_offer_type[:cashback]
      @cashback = Cart.get_discount(@cart_data, discount_type)
    else
      discount_type = Coupon.get_offer_type[:discount_amount]
      @discount = Cart.get_discount(@cart_data, discount_type)
    end
    @discount ||= 0
    @grand_total = Cart.get_grand_total(@sub_total, @discount)
  end

  def cancel_coupon
    @coupon = @cart.coupon
    @coupon.use_count = @coupon.use_count - 1
    @cart.coupon_id = nil
    @coupon.save!
    @cart.save!
    @discount = Cart.get_discount(@cart_data, Coupon.get_offer_type[:discount_amount])
    @grand_total = Cart.get_grand_total(@sub_total, @discount)
  end
end
