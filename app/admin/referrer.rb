ActiveAdmin.register Referrer do

  permit_params :name, :email, :phone_no, :is_active, :deleted_at

end
