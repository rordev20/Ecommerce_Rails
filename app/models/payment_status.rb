class PaymentStatus < ActiveRecord::Base
  acts_as_paranoid
  has_many :orders
end
