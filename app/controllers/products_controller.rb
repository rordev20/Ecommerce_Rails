class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :current_cart, only: [:index, :show]
  before_action :get_category_list

  # This method show product listing
  def index
    @item_per_row = 4
    @sorting_menus = MenuManager.get_sorting_menu_list
    if params.has_key?(:sub_category)
      @products = Product.filter(params)
      #@products = Product.active.search(params)
      @price_ranges = PriceRange.get_price_range(params[:sub_category])
      @colors = Color.get_colors(params[:sub_category])
    else
      @products = Product.get_product_list
      @price_ranges = PriceRange.all
    end
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
