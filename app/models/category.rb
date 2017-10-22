class Category < ApplicationRecord
  acts_as_paranoid
  has_many :sub_categories
  has_many :sizes
  scope :active, -> {where(is_active: true)}
  accepts_nested_attributes_for :sizes, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  @@item_per_row = 4
  cattr_accessor :item_per_row
  after_save :expire_cache
  validates :name, presence: true, uniqueness: true

  # This method return category and sub category list
  def self.get_categories_sub_categories_list
    Rails.cache.fetch ["categories_sub_categories_list"], expires_in: 24.hours do
      self.active.includes(:sub_categories).where(sub_categories: {is_active: true})
    end
  end

  private

  def expire_cache
    Rails.cache.delete('categories_sub_categories_list')
  end

end
