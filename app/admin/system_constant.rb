ActiveAdmin.register SystemConstant do

  permit_params :name, :value, :description, :is_active, :deleted_at

end
