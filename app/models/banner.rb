class Banner < ApplicationRecord
  acts_as_paranoid
  just_define_datetime_picker :start_date
  just_define_datetime_picker :end_date
  has_many :banner_device_types
  has_many :device_types, through: :banner_device_types
  has_many :banner_countries
  has_many :countries, through: :banner_countries
  has_attached_file :image, :styles => { :medium => "238x238>", 
                                         :original => ["100%", :jpg],
                                        :thumb => "100x100>"
                                      }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  after_save :expire_cache
  scope :active, -> {where(is_active: true)}


  def self.home_page_banner
    Rails.cache.fetch ["home_banners"], expires_in: 24.hours do
      self.active
    end
  end

  private

  def expire_cache
    Rails.cache.delete('home_banners')
  end
end
