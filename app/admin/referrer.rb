ActiveAdmin.register Referrer do
  menu parent: "Refferal", priority: 2
  permit_params :name, :email, :phone_no, :is_active, :deleted_at

end
