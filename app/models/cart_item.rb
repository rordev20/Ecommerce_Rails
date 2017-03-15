class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order
  belongs_to :vendor_order
  delegate :sell_price, :quantity, :id, to: :product, prefix: :prd

  # total cost for cart item
  def cart_item_total
    self.quantity * self.prd_sell_price
  end

end
