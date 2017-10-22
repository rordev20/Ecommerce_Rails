ActiveAdmin.register CouponType do
  menu parent: "Coupon", priority: 2
  permit_params :name, :is_active
end
