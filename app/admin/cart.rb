ActiveAdmin.register Cart do

  permit_params :user, :email, :coupon, :is_active, :deleted_at

end
