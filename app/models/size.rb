class Size < ApplicationRecord
  acts_as_paranoid
  belongs_to :category
  has_many :product_sizes
  has_many :products, through: :product_sizes
end
