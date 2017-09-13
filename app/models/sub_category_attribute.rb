class SubCategoryAttribute < ActiveRecord::Base
  belongs_to :sub_category
  scope :active, -> {where(is_active: true)}
end
