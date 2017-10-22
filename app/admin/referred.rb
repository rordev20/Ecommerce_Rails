ActiveAdmin.register Referred do
  menu parent: "Refferal", priority: 1
  permit_params :name, :email, :phone_no, :referrer, :is_active, :deleted_at

end
