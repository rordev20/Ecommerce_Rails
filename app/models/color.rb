class Color < ActiveRecord::Base
  has_many :color_sub_categories
  has_many :sub_categories, through: :color_sub_categories
end
