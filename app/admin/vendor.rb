ActiveAdmin.register Vendor do

  permit_params :name, :email, :description, :policy, :is_whole_seller, :rate, :is_active, :deleted_at

end
