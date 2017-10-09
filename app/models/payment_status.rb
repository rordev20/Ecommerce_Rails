class PaymentStatus < ApplicationRecord
  acts_as_paranoid
  has_many :orders
end
