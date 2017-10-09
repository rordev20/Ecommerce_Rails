class State < ApplicationRecord
  acts_as_paranoid
  belongs_to :country
  scope :active, -> {where(is_active: true)}

end
