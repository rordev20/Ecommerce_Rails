class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def self.build_order_items_attributes(cart_data)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    order_items_array = []
    cart_items.each do |cart_item|
      order_items_array << {
                            product_id: cart_item[:product_id],
                            quantity: cart_item[:quantity],
                            rate: cart_item[:per_item_cost],
                            net_amount: cart_item[:net_amount],
                            discount_amount: cart_item[:discount_amount],
                            cashback: cart_item[:cashback], 
                            brownie_point: cart_item[:brownie_point_used]
                          }
    end
    order_items_array
  end
end
