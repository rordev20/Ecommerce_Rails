class HomeController < ApplicationController
  before_action :get_category_list, :current_cart, only: [:index]
  def index
    @banners = Banner.home_page_banner
    @sub_categories = SubCategory.get_sub_category_list
  end
end
