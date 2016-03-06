class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_one :image
end
