module Mapper
  class ProductData
    def initialize(product, images)
      @product = product
      @images = images
    end

    def map
      {
        id: @product.id,
        name: @product.name,
        dimension: @product.dimension,
        description: @product.description,
        original_price: @product.original_price,
        sell_price: @product.sell_price,
        sub_category_id: @product.sub_category_id,
        color_id: @product.color_id,
        quantity: @product.quantity,
        domestic_pos: @product.domestic_pos,
        international_pos: @product.international_pos,
        specification: @product.specification,
        product_code: @product.product_code,
        weight: @product.weight,
        sell_count: @product.sell_count,
        discount_percent: @product.discount_percent,
        in_stock: @product.in_stock,
        slug: @product.slug,
        images: @images.map { |image| Mapper::ImageData.new(image).map }
      }
    end
  end
end



