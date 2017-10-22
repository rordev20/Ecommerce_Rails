ActiveAdmin.register PaymentMethod do
  menu parent: "Master", priority: 2
  permit_params :name, :is_active, :payment_mode
end
