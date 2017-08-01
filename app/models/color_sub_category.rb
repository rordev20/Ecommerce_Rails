class ColorSubCategory < ActiveRecord::Base
  belongs_to :color
  belongs_to :sub_category
end
