class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :state
  belongs_to :country
  belongs_to :vendor
  belongs_to :address_type

  def self.address_billing_same_as_shipping?(same_address)
    same_address.to_i == 1
  end
end
