class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order
  belongs_to :vendor_order

  # This method return list of product in cart
  def self.get_item_list_in_cart(cart_item_ids)
    self.includes(:product).where(id: cart_item_ids).group_by(&:product_id)
  end

end
