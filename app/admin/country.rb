ActiveAdmin.register Country do
  menu parent: "Locality", priority: 1

  permit_params :name, :iso_code, :iso_name, :is_active, :deleted_at

end
