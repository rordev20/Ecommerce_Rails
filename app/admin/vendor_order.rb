ActiveAdmin.register VendorOrder do

  permit_params :vendor, :user, :state, :payment_state, :total, :coupon, :notes, :confirmed_at,
                :discount, :shipping, :market_rate, :billing_address_id, :shipping_address_id, :cart,
                :number, :is_active, :deleted_at

end
