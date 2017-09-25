class User < ActiveRecord::Base
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses
  has_many :carts
  has_one :image, as: :imageable
  has_many :orders
  has_many :vendor_orders
  has_many :brownie_point_transactions

  def save_user_address(bill_address_same_as_ship, bill_address_params, ship_address_params)
    billing_address = self.addresses.new(bill_address_params)
    if bill_address_same_as_ship
      billing_address.save!
      {bill_address: billing_address}
    else
      shipping_address = self.addresses.new(ship_address_params)
      billing_address.save!
      shipping_address.save!
      {bill_address: billing_address, ship_address: shipping_address}
    end
  end

  # This method check if user have brownie point and using it
  def is_using_brownie_point?(cart)
    cart.use_brownie_point && self.brownie_point > 0
  end

  # This method distribute user_brownie points
  def get_cart_data_for_brownie_point(cart, cart_data)
    array_of_hash_after_brownie_point_used = []
    user_brownie_point = self.brownie_point
    sorted_cart_data = Cart.get_cart_data_sort_by_price(cart_data)
    sorted_cart_data.each do |cart_item|
      brownie_point_used = user_brownie_point > cart_item[:net_amount] ? cart_item[:net_amount] : user_brownie_point
      user_brownie_point = user_brownie_point - brownie_point_used
      net_amount = cart_item[:net_amount] - brownie_point_used
      cart_item[:net_amount] = net_amount
      cart_item[:brownie_point_used] = brownie_point_used
      array_of_hash_after_brownie_point_used << cart_item
    end
    {cart.id => array_of_hash_after_brownie_point_used}
  end

  def get_user_used_wallet_amount(cart, cart_data)
    brownie_point_used = 0
    if self.is_using_brownie_point?(cart)
      cart_data = self.get_cart_data_for_brownie_point(cart, cart_data)
      brownie_point_used = Cart.get_discount(cart_data, 'brownie_point_used')
    end
    brownie_point_used
  end

  def get_confirm_order(order_id)
    self.orders.includes(:order_items, shipping_address: [:state, :country]).where(id: order_id).first
  end

  def get_orders
    self.orders.includes(:shipping_address, order_items: [:product, :images])
  end
end
