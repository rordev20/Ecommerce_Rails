class Tax < ApplicationRecord
  belongs_to :sub_category
  belongs_to :country


  def self.evaluate_tax(cart_data, country)
    cart_data
  end

  def set_tax_by_product(cart_data, country)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    cart_items.each do |cart_item|
      # NEED to put tax logic here
    end
  end
end
