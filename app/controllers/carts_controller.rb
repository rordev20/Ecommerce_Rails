class CartsController < ApplicationController
  before_action :current_cart, only: [:show]

  #This method show cart page
  def show
    @cart_items = @cart.items_in_cart
  end

end
