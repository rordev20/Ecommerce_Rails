class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_one :image
  scope :active, -> {where(is_active: true)}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
