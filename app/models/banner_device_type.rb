class BannerDeviceType < ActiveRecord::Base
  belongs_to :banner
  belongs_to :device_type
end
