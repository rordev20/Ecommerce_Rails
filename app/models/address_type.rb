class AddressType < ActiveRecord::Base
  has_many :addresses

  def self.bill_address
    self.find_by_name('billing_address')
  end

  def self.ship_addess
    self.find_by_name('shipping_address')
  end
end
