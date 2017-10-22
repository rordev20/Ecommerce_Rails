class DiscountType < ApplicationRecord
  acts_as_paranoid
  has_many :coupons
  validates :name, presence: true, uniqueness: true
end
