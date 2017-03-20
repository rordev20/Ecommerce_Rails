ActiveAdmin.register Image do

  permit_params :product, :photo, :vendor, :user, :category, :sub_category, :position, :is_active, :deleted_at

end
