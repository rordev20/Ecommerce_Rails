ActiveAdmin.register PriceRange do
  includes :sub_category

  permit_params :min_price, :min_price, :sub_category_id, :is_active, :deleted_at

  index do
    column :min_price
    column :min_price
    column :sub_category
    column :created_at
    column :updated_at
    actions
  end

end
