ActiveAdmin.register CartItem do
  menu parent: "Cart", priority: 2
  permit_params :cart, :product, :quantity, :size, :note, :vendor_order, :state,
                :is_active, :deleted_at

end
