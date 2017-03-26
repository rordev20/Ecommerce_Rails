class DiscountType < ActiveRecord::Base
  has_many :coupons
end
