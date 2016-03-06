class User < ActiveRecord::Base
  has_many :addresses
  has_many :carts
  has_one :image
  has_many :orders
  has_many :vendor_orders
end
