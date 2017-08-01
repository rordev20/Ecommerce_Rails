ActiveAdmin.register Color do

  permit_params :name, :code, :is_active, :deleted_at

end
