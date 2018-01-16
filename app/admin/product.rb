ActiveAdmin.register Product do
  menu parent: "Product", priority: 1

  permit_params :name, :dimension, :description, :purchase_price, :vendor, :sub_category_id, :quantity, :color_id, :domestic_pos, :international_pos, :specification, :product_code,
                :weight, :sell_count, :notes, :clicks, :discount_percent, :discount_amount, :in_stock, :is_active, :deleted_at, :sell_price, :original_price,
                images_attributes: [ :id, :avatar, :position, :_destroy ], product_sizes_attributes: [:id, :size_id, :quantity, :_destroy],
                product_attributes_attributes: [ :id, :sub_category_attribute_id, :description, :position, :is_active, :_destroy ]

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :sub_category, input_html: { class: "select2" }
      f.input :name
      f.input :dimension
      f.input :description
      f.input :purchase_price
      f.input :original_price
      f.input :sell_price
      f.input :quantity
      f.has_many :images, heading: false, allow_destroy: true do |img|
        img.input :avatar, label: "Product Image"
        img.input :position
      end
      f.inputs "Sizes" do
        f.has_many :product_sizes, heading: false, allow_destroy: true do |ps|
          ps.input :size, :as => :select, :collection => f.object.persisted? ? f.object.sub_category.category.sizes : ''
          ps.input :quantity
        end
      end
      f.input :color
      f.input :domestic_pos
      f.input :international_pos
      f.input :specification
      f.input :product_code
      f.input :weight
      f.input :sell_count
      f.input :notes
      f.input :clicks
      f.input :discount_percent
      f.input :in_stock
      f.input :is_active
      f.input :deleted_at
      f.inputs "Attributes" do
        f.has_many :product_attributes, heading: false, allow_destroy: true do |pa|
          pa.input :sub_category_attribute
          pa.input :description
          pa.input :position
          pa.input :is_active
        end
      end
    end
    f.actions
  end

  controller do
    def get_sub_category_attributes
      sub_category_attributes = SubCategory.find(params[:sub_category_id]).sub_category_attributes.where(attribute_type: 'specification').active
      respond_to do |format|
        format.json { render json: sub_category_attributes }
      end
    end

    def get_category_sizes
      sizes = SubCategory.find(params[:sub_category_id]).category.sizes
      respond_to do |format|
        format.json { render json: sizes }
      end
    end

    def scoped_collection
      super.includes :sub_category, :color, :vendor # prevents N+1 queries to your database
    end
  end
end
