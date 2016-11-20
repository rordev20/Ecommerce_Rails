ActiveAdmin.register SubCategory do

  permit_params :name, :description, :category, :is_active, :deleted_at

end
