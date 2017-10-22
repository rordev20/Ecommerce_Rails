class Vendor < ApplicationRecord
  acts_as_paranoid
  has_many :bank_accounts
  has_one :image, as: :imageable
  has_one :address
  has_many :products
  validates :name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
end
