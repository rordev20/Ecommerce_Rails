class MenuManager < ActiveRecord::Base
  belongs_to :menu_type
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  scope :active, -> {where(is_active: true)}
  after_save :expire_cache

  def self.get_sorting_menu_list
    menu_type = MenuType.get_menu_type('sort')
    if menu_type.present?
      Rails.cache.fetch ["menu_manager_#{menu_type.id}"], expires_in: 24.hours do
        menu_type.menu_managers.active.order(:position).select('id, slug, display_name')
      end
    end
  end

  private

  def expire_cache
    Rails.cache.delete_matched('menu_manager_*')
  end
end
