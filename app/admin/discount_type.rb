ActiveAdmin.register DiscountType do
  menu parent: "Coupon", priority: 3
  permit_params :name, :is_active
end
