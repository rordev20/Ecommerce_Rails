class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  has_many :cart_items
  has_many :products, through: :cart_items

  # This method return list of cart items in cart
  def items_in_cart
    self.cart_items.includes(:product)
  end

  # Number of product in cart
  def product_in_cart
    self.cart_items.pluck(:quantity).sum
  end
end
