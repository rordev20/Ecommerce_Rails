class Country < ActiveRecord::Base
  has_one :currency_rate
  has_many :states
  scope :active, -> {where(is_active: true)}

  # This method return list of active countries
  def self.list_of_countries
    self.active
  end

  # This method return list of active states
  def list_of_states
    self.states.active
  end
end
