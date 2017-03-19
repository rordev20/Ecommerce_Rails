class PaymentMethod < ActiveRecord::Base
  scope :active, -> {where(is_active: true)}
end
