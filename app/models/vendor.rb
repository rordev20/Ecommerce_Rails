class Vendor < ActiveRecord::Base
  has_many :bank_accounts
  has_one :image, as: :imageable
  has_one :address
  has_many :products
end
