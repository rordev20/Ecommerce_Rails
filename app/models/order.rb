class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  belongs_to :cart
end
