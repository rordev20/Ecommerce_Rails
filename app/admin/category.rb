ActiveAdmin.register Category do

  permit_params :name, :description, :is_active, :deleted_at

end
