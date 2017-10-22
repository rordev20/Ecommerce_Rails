ActiveAdmin.register Cart do
  menu parent: "Cart", priority: 1

  permit_params :user, :email, :coupon, :is_active, :deleted_at

end
