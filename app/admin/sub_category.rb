ActiveAdmin.register SubCategory do

  permit_params :name, :description, :category_id, :is_active, :deleted_at

end
