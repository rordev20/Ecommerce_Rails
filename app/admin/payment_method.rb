ActiveAdmin.register PaymentMethod do
  permit_params :name, :is_active, :payment_mode
end
