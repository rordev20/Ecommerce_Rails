class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order
  belongs_to :designer_order
end
