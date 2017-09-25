class Address < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user
  belongs_to :state
  belongs_to :country
  belongs_to :vendor
  belongs_to :address_type

  validates :country, presence: true
  validates :state, presence: true
  validates :address1, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true

  def self.address_billing_same_as_shipping?(same_address)
    same_address.to_i == 1
  end
end
