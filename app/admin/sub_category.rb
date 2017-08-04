ActiveAdmin.register SubCategory do

  permit_params :name, :description, :image, :category_id, :is_active, :deleted_at, color_ids: []

  form do |f|
    f.inputs "Coupon" do
      f.input :category
      f.input :name
      f.input :description
      f.input :image, as: :file
      f.input :colors, as: :check_boxes
      f.input :is_active
    end
    f.actions
  end

end
