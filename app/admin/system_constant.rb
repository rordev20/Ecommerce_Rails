ActiveAdmin.register SystemConstant do
  menu parent: "Master", priority: 1
  permit_params :name, :value, :description, :is_active, :deleted_at

end
