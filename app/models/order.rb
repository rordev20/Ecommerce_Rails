class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  belongs_to :cart
  belongs_to :order_status
  belongs_to :payment_status
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: 'Address'
  belongs_to :shipping_address, foreign_key: :shipping_address_id, class_name: 'Address'
  has_many :cart_items

  def set_address(bill_address_same_as_ship, order_address_hash)
    self.billing_address_id = order_address_hash[:bill_address].id
    if bill_address_same_as_ship
      self.shipping_address_id = order_address_hash[:bill_address].id
    else
      self.shipping_address_id = order_address_hash[:ship_address].id
    end
  end
end
