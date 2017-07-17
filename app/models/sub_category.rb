class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_one :image
  has_many :products
  scope :active, -> {where(is_active: true)}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
