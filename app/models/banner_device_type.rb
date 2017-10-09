class BannerDeviceType < ApplicationRecord
  belongs_to :banner
  belongs_to :device_type
end
