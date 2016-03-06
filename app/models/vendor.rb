class Vendor < ActiveRecord::Base
  has_many :bank_accounts
  has_one :image
  has_one :address
  has_many :products
end
