class MenuType < ActiveRecord::Base
  has_many :menu_managers
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  after_save :expire_cache
  scope :active, -> {where(is_active: true)}

  def self.get_menu_type(slug)
    Rails.cache.fetch ["menu_type_#{slug}"], expires_in: 24.hours do
      MenuType.active.where(slug: slug).first
    end
  end
  
  private

  def expire_cache
    Rails.cache.delete("menu_type_#{self.slug}") 
  end
end
