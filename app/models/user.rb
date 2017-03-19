class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses
  has_many :carts
  has_one :image
  has_many :orders
  has_many :vendor_orders

  def save_user_address(bill_address_same_as_ship, bill_address_params, ship_address_params)
    billing_address = self.addresses.new(bill_address_params)
    if bill_address_same_as_ship
      billing_address.save!
      {bill_address: billing_address}
    else
      shipping_address = self.addresses.new(ship_address_params)
      billing_address.save!
      shipping_address.save!
      {bill_address: billing_address, ship_address: shipping_address}
    end
  end
end
