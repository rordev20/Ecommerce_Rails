class Category < ActiveRecord::Base
  has_many :sub_categories
  has_one :image
  scope :active, -> {where(is_active: true)}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  # This method return category and sub category list
  def self.get_categories_sub_categories_list
    Rails.cache.fetch ["categories"], expires_in: 60.minutes do
      self.active.includes(:sub_categories).where(sub_categories: {is_active: true})
    end
  end
end
