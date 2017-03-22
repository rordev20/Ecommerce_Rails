class SystemConstant < ActiveRecord::Base

  def self.get_value_in_array(name)
    self.find_by_name(name) ? JSON.parse(self.find_by_name(name).value) : []
  end
end
