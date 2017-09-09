class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  belongs_to :order_status
  belongs_to :payment_status
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: 'Address'
  belongs_to :shipping_address, foreign_key: :shipping_address_id, class_name: 'Address'
  belongs_to :payment_method

  validates :cart, presence: true
  validates :user, presence: true
  validates :billing_address, presence: true
  validates :shipping_address, presence: true
  validates :total, presence: true
  validates :grand_total, presence: true
  validates :payment_method, presence: true

  after_save :update_user_wallet

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
    cashback_discount_hash = cart.get_cashback_discount_hash(cart_data)
    cashback, discount = cashback_discount_hash[:cashback], cashback_discount_hash[:discount]
    {
      total: Cart.get_cart_total(cart_data),
      discount: discount,
      brownie_point: current_user.get_user_used_wallet_amount(cart, cart_data),
      cashback: cashback,
      grand_total: Cart.get_cart_total(cart_data),
      cart: cart,
      user: current_user
    }
  end

  # This method set user wallet after order creation
  def update_user_wallet
    user = self.user
    user.brownie_point -= self.brownie_point
    user.save!
  end
end
