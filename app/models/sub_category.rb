class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products
  has_many :price_ranges
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  scope :active, -> {where(is_active: true)}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  after_save :expire_cache

  def self.get_sub_category_list
    Rails.cache.fetch ["sub_categories_list"], expires_in: 24.hours do
      SubCategory.select("DISTINCT sub_categories.*").joins(:category, :products).where('categories.is_active = ? AND sub_categories.is_active = ? AND products.is_active = ?', true, true, true)
    end
  end

  def self.get_sub_category(slug)
    Rails.cache.fetch ["sub_category_#{slug}"], expires_in: 24.hours do
      SubCategory.find(slug)
    end
  end

  private

  def expire_cache
    Rails.cache.delete('sub_categories_list')
    Rails.cache.delete_matched("sub_category_*")
    Rails.cache.delete("price_ranges_#{self.id}")
  end
end
