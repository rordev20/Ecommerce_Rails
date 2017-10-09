class PaymentMethod < ApplicationRecord
  acts_as_paranoid
  scope :active, -> {where(is_active: true)}
  has_many :orders
end
