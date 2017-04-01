ActiveAdmin.register Event do

  permit_params :name, :is_active, :deleted_at

end
