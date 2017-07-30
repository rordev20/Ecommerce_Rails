ActiveAdmin.register PriceRange do

  permit_params :min_price, :max_price, :sub_category_id, :is_active, :deleted_at

end
