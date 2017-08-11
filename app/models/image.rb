class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.get_product_page_image(product)
    Rails.cache.fetch ["product_images_#{product.id}"], expires_in: 24.hours do
      product.images.order(:position)
    end
  end

end
