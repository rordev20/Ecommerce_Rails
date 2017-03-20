class Product < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :sub_category
  has_many :images
  has_many :cart_items
  has_many :carts, through: :cart_items
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['avatar'].blank? }, allow_destroy: true
  scope :active, -> {where(is_active: true)}
end
