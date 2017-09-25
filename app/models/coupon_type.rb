class CouponType < ActiveRecord::Base
  acts_as_paranoid
  has_many :coupons
end
