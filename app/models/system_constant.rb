class SystemConstant < ApplicationRecord
  acts_as_paranoid
  validates :name, presence: true, uniqueness: true

  def self.get_value_in_array(name)
    self.find_by_name(name) ? JSON.parse(self.find_by_name(name).value) : []
  end

  def self.get_value(name)
    Rails.cache.fetch ["system_constant_cache_", name], expires_in: 10.minutes do
      system_constant = find_by_name(name)
      system_constant ? system_constant.value : nil
    end
  end
end
