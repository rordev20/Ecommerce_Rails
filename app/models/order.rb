class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  belongs_to :cart
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: 'Address'
  belongs_to :shipping_address, foreign_key: :shipping_address_id, class_name: 'Address'
  has_many :cart_items
end
