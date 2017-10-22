class Color < ApplicationRecord
  acts_as_paranoid
  has_many :color_sub_categories
  has_many :sub_categories, through: :color_sub_categories
  has_many :products
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  scope :active, -> {where(is_active: true)}
  after_save :expire_cache
  validates :name, presence: true, uniqueness: true

  def self.get_colors(sub_category_slug)
    sub_category = SubCategory.get_sub_category(sub_category_slug)
    Rails.cache.fetch ["color_sub_category_#{sub_category.id}"], expires_in: 24.hours do
      sub_category.colors.active.select(:id, :name)
    end
  end

  def expire_cache
    Rails.cache.delete_matched("color_sub_category_*")
  end
end
