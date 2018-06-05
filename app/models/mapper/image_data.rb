module Mapper
  class ImageData
    def initialize(image)
      @image = image
    end

    def map
      {
        image: @image.avatar.url
      }
    end
  end
end