class ProductsController < ApplicationController

  before_action :set_product, only: [:show]
  before_action :current_cart, only: [:index, :show]

  # This method show product listing
  def index
    @item_per_row = 4
    @products = Product.all
    @cart_item = @cart.cart_items.new
  end

  # This method show product details
  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
