class Banner < ActiveRecord::Base
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
  scope :active, -> {where(is_active: true)}
                             
end
