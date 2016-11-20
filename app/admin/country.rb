ActiveAdmin.register Country do

  permit_params :name, :iso_code, :iso_name, :is_active, :deleted_at

end
