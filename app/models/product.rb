class Product < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :sub_category
  has_many :images
  has_many :cart_items
  has_many :carts, through: :cart_items
end
