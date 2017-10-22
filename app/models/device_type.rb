class DeviceType < ApplicationRecord
  acts_as_paranoid
  has_many :banner_device_types
  has_many :banners, through: :banner_device_types
  validates :name, presence: true, uniqueness: true
end
