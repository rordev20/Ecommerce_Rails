ActiveAdmin.register CartItem do

  permit_params :cart, :product, :quantity, :size, :note, :vendor_order, :state,
                :is_active, :deleted_at

end
