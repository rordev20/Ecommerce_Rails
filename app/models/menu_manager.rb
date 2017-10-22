class MenuManager < ApplicationRecord
  acts_as_paranoid
  belongs_to :menu_type
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  scope :active, -> {where(is_active: true)}
  scope :without_signin_menu, -> {where(sign_in_required: false)}
  after_save :expire_cache
  validates :name, :display_name, presence: true, uniqueness: true

  def self.get_menu_list(menu_type)
    menu_type = MenuType.get_menu_type(menu_type)
    menu_managers = []
    if menu_type.present?
      menu_managers = Rails.cache.fetch ["menu_manager_#{menu_type.id}"], expires_in: 24.hours do
        menu_type.menu_managers.active.order(:position).select('id, slug, display_name, url, icon_class')
      end
    end
    menu_managers
  end

  def self.get_without_signin_menu(all_main_menus)
    menus = []
    unless all_main_menus.empty?
      menus = Rails.cache.fetch ["main_menu"], expires_in: 24.hours do
        all_main_menus.without_signin_menu
      end
    else
      menus
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
