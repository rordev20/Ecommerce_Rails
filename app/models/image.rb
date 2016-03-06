class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
end
