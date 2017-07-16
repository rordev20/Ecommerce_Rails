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

  def self.get_cart_item_qty_and_total_hash(cart_items)
    cart_items_data = []
    cart_items.each do |cart_item|
      cart_items_data << cart_item.build_cart_item_data
    end
    cart_items_data.to_json.html_safe
  end

  def build_cart_item_data
     item_total_selector = self.select_as_klass('item_total_')
     item_qty_selector = self.select_as_klass('item_qty_')
    {:item_total_selector => item_total_selector, :item_qty_selector => item_qty_selector, :item_total => self.cart_item_total, :item_qty => self.quantity }
  end

  def select_as_klass(klass)
    '.' + klass + id.to_s
  end
end
