ActiveAdmin.register Image do

  permit_params :product, :photo, :vendor, :user, :category, :sub_category, :is_active, :deleted_at

end
