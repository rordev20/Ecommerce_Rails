class HomeController < ApplicationController
  before_action :get_category_list
  def index
    @banners = Banner.active
    @sub_categories = SubCategory.get_sub_category_list
  end
end
