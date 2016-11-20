ActiveAdmin.register State do

  permit_params :name, :abbr, :country, :is_active, :deleted_at

end
