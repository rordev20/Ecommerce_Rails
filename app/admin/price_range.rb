ActiveAdmin.register PriceRange do
  menu parent: "Product", priority: 2
  includes :sub_category

  permit_params :min_price, :max_price, :sub_category_id, :is_active, :deleted_at

  index do
    column :min_price
    column :max_price
    column :sub_category
    column :created_at
    column :updated_at
    actions
  end

end
