class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :current_cart, only: [:index, :show]
  before_action :get_category_list

  # This method show product listing
  def index
    @item_per_row = 4
    #if params.present?
      #@products = Product.active.search(params)
    #else
      @products = Product.includes(:sub_category, :images).active
    #end
    @cart_item = @cart.cart_items.new
  end

  # This method show product details
  def show
    @cart_item = @cart.cart_items.new
    @product_images = Image.get_product_page_image(@product.images)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
