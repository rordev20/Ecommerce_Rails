class CartsController < ApplicationController
  before_action :current_cart, only: [:show]

  #This method show cart page
  def show
    @cart_items = CartItem.get_item_list_in_cart(@cart.cart_items.pluck(:id))
  end

end
