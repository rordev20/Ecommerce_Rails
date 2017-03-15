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

  # This method return cart net total amount
  def self.get_cart_total(cart_data)
    total = 0
    cart_data.each do |cart_id, items_array|
      items_array.each do |item|
      total += item[:net_amount]
      end
    end
    total
  end
end
