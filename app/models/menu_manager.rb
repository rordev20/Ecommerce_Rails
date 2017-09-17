class MenuManager < ActiveRecord::Base
  belongs_to :menu_type
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  scope :active, -> {where(is_active: true)}
  scope :without_signin_menu, -> {where(sign_in_required: false)}
  after_save :expire_cache

  def self.get_menu_list(menu_type)
    menu_type = MenuType.get_menu_type(menu_type)
    if menu_type.present?
      Rails.cache.fetch ["menu_manager_#{menu_type.id}"], expires_in: 24.hours do
        menu_type.menu_managers.active.order(:position).select('id, slug, display_name, url')
      end
    end
  end

  def self.get_without_signin_menu(all_main_menus)
    Rails.cache.fetch ["main_menu"], expires_in: 24.hours do
      all_main_menus.without_signin_menu
    end
  end

  def self.main_menu_list(user)
    all_main_menus = self.get_menu_list('main')
    @main_menu = user ?  all_main_menus : self.get_without_signin_menu(all_main_menus)
  end

  private

  def expire_cache
    Rails.cache.delete_matched('menu_manager_*')
    Rails.cache.delete('main_menu')
  end
end
