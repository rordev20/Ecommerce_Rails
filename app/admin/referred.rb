ActiveAdmin.register Referred do

  permit_params :name, :email, :phone_no, :referrer, :is_active, :deleted_at

end
