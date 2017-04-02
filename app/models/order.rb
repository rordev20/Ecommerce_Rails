class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  belongs_to :order_status
  belongs_to :payment_status
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: 'Address'
  belongs_to :shipping_address, foreign_key: :shipping_address_id, class_name: 'Address'
  has_many :cart_items

  # This method set user billing and shipping address
  def set_address(bill_address_same_as_ship, order_address_hash)
    self.billing_address_id = order_address_hash[:bill_address].id
    if bill_address_same_as_ship
      self.shipping_address_id = order_address_hash[:bill_address].id
    else
      self.shipping_address_id = order_address_hash[:ship_address].id
    end
  end

  # This method build order params by cart data
  def self.build_order_params(cart_data, cart, current_user)
    discount, brownie_point_used, cashback = 0, 0, 0
    total = Cart.get_cart_total(cart_data)
    coupon = cart.coupon
    if coupon
      cart_data = coupon.get_cart_data_for_coupon(cart_data, cart)
      discount_type = coupon.is_cashback_coupon? ? Coupon.get_offer_type[:cashback] : Coupon.get_offer_type[:discount_amount]
      discount = Cart.get_discount(cart_data, discount_type)
    end
    cashback = Cart.get_discount(cart_data, discount_type) if coupon && coupon.is_cashback_coupon?
    if current_user.is_using_brownie_point?(cart)
      cart_data = current_user.get_cart_data_for_brownie_point(cart, cart_data)
      brownie_point_used = Cart.get_discount(cart_data, 'brownie_point_used')
    end
    grand_total = Cart.get_cart_total(cart_data)
    current_user.orders.new({total: total, grand_total: grand_total, discount: discount, brownie_point: brownie_point_used, cashback: cashback, cart: cart})
  end
end
