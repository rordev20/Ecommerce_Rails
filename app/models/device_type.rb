class DeviceType < ActiveRecord::Base
  has_many :banner_device_types
  has_many :banners, through: :banner_device_types
end
