class Api::HomeController < ApiController
  def index
    @sub_categories = SubCategory.get_sub_category_list
    render json: {users:
      @sub_categories.map do |sub_category|
        Mapper::SubCategoryData.new(sub_category).map
      end
    }
  end
end