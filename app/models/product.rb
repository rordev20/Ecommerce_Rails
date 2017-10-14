class Product < ApplicationRecord
  # Elastic search module commented
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
  acts_as_paranoid
  belongs_to :vendor, optional: true
  belongs_to :sub_category
  has_many :images, as: :imageable
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :product_attributes
  belongs_to :color
  has_and_belongs_to_many :sizes
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['avatar'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :product_attributes
  scope :active, -> {where(is_active: true)}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  after_save :expire_cache
  validates :quantity, numericality: { greater_than: 0}, presence: true
  before_save :set_fields

  def set_fields
    self.sell_price = get_sell_price
  end

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
      products = sub_category.products.includes(:images, :color, :sizes).active
    else
      products = self.get_product_list
    end
    products = get_products_by_colors(products, options[:color_ids]) if options[:color_ids].present?
    products = get_products_in_price_range(products, options[:price_ranges_ids]) if options[:price_ranges_ids].present?
    products = sort_product(products, options[:sort_by]) if options[:sort_by].present? 
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

  def self.sort_product(products, sort_param)
    case sort_param
    when 'latest'
      products.sort_by(&:created_at)
    when 'low'
      products.sort_by(&:sell_price)
    when 'high'
      products.sort_by(&:sell_price).reverse
    end
  end

  def get_sizes
    Rails.cache.fetch ["product_sizes_#{self.id}"], expires_in: 24.hours do
      self.sizes
    end
  end

  def get_product_attributes
    Rails.cache.fetch ["product_attributes_#{self.id}"], expires_in: 24.hours do
      self.product_attributes.active
    end
  end

  def get_product_sub_category_attributes
    sub_category.sub_category_attributes.where.not(attribute_type: 'specification').active
  end

  protected

  def get_sell_price
    discounted_price = discount_percent/BigDecimal.new(100) * original_price
    (original_price - discounted_price).floor
  end

  private

  def expire_cache
    Rails.cache.delete('product_list')
    Rails.cache.delete('product_images_#{self.id}')
    Rails.cache.delete('product_sizes_#{self.id}')
    Rails.cache.delete('product_attributes_#{self.id}')
  end
end
