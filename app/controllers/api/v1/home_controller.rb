class Api::V1::HomeController < ApiController
  def index
    @sub_categories = SubCategory.get_sub_category_list
    render json: { sub_categories:
      @sub_categories.map do |sub_category|
        Mapper::SubCategoryData.new(sub_category).map
      end
    }
  end
end