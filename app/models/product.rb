class Product < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  belongs_to :vendor
  belongs_to :sub_category
  has_many :images
  has_many :cart_items
  has_many :carts, through: :cart_items
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['avatar'].blank? }, allow_destroy: true
  scope :active, -> {where(is_active: true)}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def self.search(params)
    tire.search(load: true)  do
      query { string params[:query] } if params[:query].present?
    end
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
end
