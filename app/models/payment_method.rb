class PaymentMethod < ActiveRecord::Base
  scope :active, -> {where(is_active: true)}
  has_many :orders
end
