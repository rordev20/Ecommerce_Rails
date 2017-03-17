class State < ActiveRecord::Base
  belongs_to :country
  scope :active, -> {where(is_active: true)}

end
