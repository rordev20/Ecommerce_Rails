class CartsController < ApplicationController
  before_action :current_cart, only: [:show]

  #This method show cart page
  def show
    create_cart_data
    @cart_items = @cart.items_in_cart
    @sub_total = Cart.get_cart_total(@cart_data)
  end

end
