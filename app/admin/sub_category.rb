ActiveAdmin.register SubCategory do
  menu parent: "Category", priority: 2

  permit_params :name, :description, :image, :category_id, :is_active, :deleted_at, color_ids: [],
  price_ranges_attributes: [ :id, :min_price, :max_price, :is_active, :_destroy ],
  sub_category_attributes_attributes: [ :id, :attribute_type, :name, :content, :position, :is_active, :_destroy ]

  form do |f|
    f.inputs "Sub Category" do
      f.input :category
      f.input :name
      f.input :description
      f.input :image, as: :file
      f.input :colors, as: :check_boxes
      f.input :is_active
    end
    f.inputs "Attributes" do
      f.has_many :sub_category_attributes, heading: false, allow_destroy: true do |sca|
        sca.input :attribute_type, as: :select, collection: SubCategory.get_attribute_type_lists
        sca.input :name
        sca.input :content
        sca.input :position
        sca.input :is_active
      end
    end
    f.inputs "Price Ranges" do
      f.has_many :price_ranges, heading: false, allow_destroy: true do |pr|
        pr.input :min_price
        pr.input :max_price
        pr.input :is_active
      end
    end
    f.actions
  end

end
