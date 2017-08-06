class MenuType < ActiveRecord::Base
  has_many :menu_managers
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  after_save :expire_cache

  def self.get_by_slug(slug)
    Rails.cache.fetch ["menu_type_#{slug}"], expires_in: 24.hours do
      MenuType.find(slug)
    end
  end
  
  private

  def expire_cache
    Rails.cache.delete("menu_type_#{self.slug}") 
  end
end
