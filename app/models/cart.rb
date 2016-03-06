class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  has_many :cart_items
end
