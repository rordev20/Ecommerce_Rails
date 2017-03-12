class PaymentStatus < ActiveRecord::Base
  has_many :orders
end
