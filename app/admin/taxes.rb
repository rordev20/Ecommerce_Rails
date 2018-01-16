ActiveAdmin.register Tax do
  permit_params :name, :rate, :sub_category_id, :country_id, :min_range, :max_range, :is_active, :deleted_at

end
