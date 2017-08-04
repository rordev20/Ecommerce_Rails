class Product < ActiveRecord::Base
  # Elastic search module commented
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
  belongs_to :vendor
  belongs_to :sub_category
  has_many :images
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :color
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['avatar'].blank? }, allow_destroy: true
  scope :active, -> {where(is_active: true)}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  after_save :expire_cache

  def self.get_product_list
    Rails.cache.fetch ["product_list"], expires_in: 24.hours do
      self.includes(:sub_category, :images, :color).active
    end
  end

  def self.search(params)
    #tire.search(load: true)  do
      #query { string params[:query] } if params[:query].present?
    #end
  end

  def to_indexed_json
    to_json(methods: [:sub_category_name, :category_name])
  end

  def sub_category_name
    sub_category.name
  end

  def category_name
    sub_category.category.name
  end

  def self.filter(options = {})
    if options[:sub_category].present?
      sub_category = SubCategory.get_sub_category(options[:sub_category])
      products = sub_category.products.includes(:images, :color)
    else
      products = self.get_product_list
    end
    products = get_products_by_colors(products, options[:color_ids]) if options[:color_ids].present?
    products = get_products_in_price_range(products, options[:price_ranges_ids]) if options[:price_ranges_ids].present?
    products
  end

  def self.filtered_by_price(products, options = {})
    min = options[:min_price]
    max = options[:max_price]
    product = Product.arel_table
    if min.present? && max.present?
      products.where(sell_price: min..max)
    elsif min.present? && max.blank?
      products.where(product[:sell_price].gt(min))
    elsif max.present? && min.blank?
      products.where(product[:sell_price].lt(max))
    else
      products
    end
  end

  def self.get_products_by_colors(products, color_ids)
    products.where('color_id IN (?)', color_ids)
  end

  def self.get_products_in_price_range(products, price_ranges_ids)
    product_by_range = []
    price_range_lists = PriceRange.get_price_list_by_ids(price_ranges_ids)
    price_range_lists.each do |price_range|
      product_by_range += self.filtered_by_price(products, {min_price: price_range.min_price, max_price: price_range.max_price})
    end
    product_by_range
  end

  private

  def expire_cache
    Rails.cache.delete('product_list')
  end
end
