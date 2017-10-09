class CartItem < ApplicationRecord
  acts_as_paranoid
  belongs_to :cart
  belongs_to :product
  belongs_to :size, optional: true
  belongs_to :vendor_order, optional: true
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

  def save_cart_item(cart_item_params)
    self.quantity = self.quantity.to_i + cart_item_params[:quantity].to_i
    self.size_id = cart_item_params[:size_id].to_i if cart_item_params.has_key?(:size_id)
    raise CustomException::SizeMissing if cart_item_params.has_key?(:size_id) && cart_item_params[:size_id].blank?
    self.save!
  end
end
