class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.get_product_page_image(product_images)
    product_images.order(:position)
  end

end
