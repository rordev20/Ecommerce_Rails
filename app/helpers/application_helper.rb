module ApplicationHelper

  def product_data(product)
  end

  def product_image(images, image_type)
    if images.first.present?
      first_image = images.first
      case image_type
      when 'thumb'
        image_tag first_image.avatar.url :thumb, alt: 'Product'
      when 'medium'
        image_tag(first_image.avatar.url(:medium), class: "product-image-style")
      else
        image_tag(first_image.avatar.url(:medium), class: "product-image-style")
      end
    else
      # Assuming you have a default.svg in your assets folder
      case image_type
      when 'thumb'
        image_tag 'product/default.jpg', style: 'height: 80px; width:80px;', alt: 'Product'
      else
        image_tag 'product/default.jpg', class: "product-image-style"
      end
    end
  end
end
