class PriceRange < ApplicationRecord
  acts_as_paranoid
  belongs_to :sub_category
  scope :active, -> {where(is_active: true)}
  after_save :expire_cache
  validates_numericality_of :min_price, presence: true
  validates_numericality_of :max_price, presence: true
  validate :max_price_must_be_greater_than_min_price

  def self.get_price_range(sub_category_slug)
    sub_category = SubCategory.get_sub_category(sub_category_slug)
    Rails.cache.fetch ["price_ranges_by_sub_category_#{sub_category.id}"], expires_in: 24.hours do
      sub_category.price_ranges.active.select('id, min_price, max_price')
    end
  end

  def self.get_price_list_by_ids(price_range_ids)
    Rails.cache.fetch ["price_ranges_#{price_range_ids.join('_')}"], expires_in: 24.hours do
      self.select('id, min_price, max_price').where(id: price_range_ids)
    end
  end

  def expire_cache
    Rails.cache.delete_matched("price_ranges_*")
    Rails.cache.delete_matched("price_ranges_by_sub_category_*")
  end

  private

  def max_price_must_be_greater_than_min_price
    if min_price.present? && max_price.present? && max_price <= min_price
      errors.add :max_price, "must be greater than min price"
    end
  end
end
