class PaymentMethod < ApplicationRecord
  acts_as_paranoid
  scope :active, -> {where(is_active: true)}
  has_many :orders
  validates :name, presence: true, uniqueness: true
  validates :payment_mode, presence: true
end
