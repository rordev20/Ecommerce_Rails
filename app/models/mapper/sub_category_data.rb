module Mapper
  class SubCategoryData
    def initialize(sub_category)
      @sub_category = sub_category
    end

    def map
      {
        id: @sub_category.id,
        name: @sub_category.name,
        description: @sub_category.description,
        category_id: @sub_category.category_id,
        image: @sub_category.image.url
      }
    end
  end
end