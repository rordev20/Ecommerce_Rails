class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def index
    @item_per_row = 4
    @products = Product.all
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
