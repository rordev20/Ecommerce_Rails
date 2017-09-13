class ProductAttribute < ActiveRecord::Base
  belongs_to :product
  belongs_to :sub_category_attribute
  scope :active, -> {where(is_active: true)}
  before_save :set_name

  def set_name
    self.name = SubCategoryAttribute.find_by_id(self.sub_category_attribute_id).try(:name)
  end
end
