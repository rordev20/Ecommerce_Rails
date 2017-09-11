ActiveAdmin.register Product do

  permit_params :name, :dimension, :description, :purchase_price, :vendor, :sub_category_id, :quantity, :color_id, :domestic_pos, :international_pos, :specification, :product_code,
                :weight, :sell_count, :notes, :clicks, :discount_percent, :discount_amount, :in_stock, :is_active, :deleted_at, :sell_price,
                images_attributes: [ :id, :avatar, :position, :_destroy ], size_ids: [],
                product_attributes_attributes: [ :id, :sub_category_attribute_id, :description, :position, :is_active, :_destroy ]

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :sub_category
      f.input :name
      f.input :dimension
      f.input :description
      f.input :sell_price
      f.input :purchase_price
      f.input :quantity
      f.has_many :images, heading: false, allow_destroy: true do |img|
        img.input :avatar, label: "Product Image"
        img.input :position
      end
      f.input :sizes, as: :check_boxes
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
      f.input :discount_amount
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
      @sub_category_attributes = SubCategory.find_by_id(params[:sub_category_id]).try(:sub_category_attributes)
      respond_to do |format|
        format.json { render json: @sub_category_attributes }
      end
    end
  end
end
