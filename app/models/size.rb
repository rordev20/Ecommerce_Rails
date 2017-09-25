class Size < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :category
  has_and_belongs_to_many :products
end
