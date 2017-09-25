class SubCategoryAttribute < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :sub_category
  scope :active, -> {where(is_active: true)}
end
