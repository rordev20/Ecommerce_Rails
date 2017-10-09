class DiscountType < ApplicationRecord
  acts_as_paranoid
  has_many :coupons
end
