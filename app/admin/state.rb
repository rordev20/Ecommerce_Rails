ActiveAdmin.register State do
  menu parent: "Locality", priority: 2

  permit_params :name, :abbr, :country, :is_active, :deleted_at

end
