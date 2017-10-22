class AddressType < ApplicationRecord
  acts_as_paranoid
  has_many :addresses
  validates :name, presence: true, uniqueness: true

  def self.bill_address
    self.find_by_name('billing_address')
  end

  def self.ship_addess
    self.find_by_name('shipping_address')
  end
end
