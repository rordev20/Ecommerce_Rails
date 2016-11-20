ActiveAdmin.register Order do

  permit_params :user, :total, :shipping, :state, :number, :coupon, :payment_state, :cod_charge, :cart,
                :currency_rate, :pay_type, :notes, :discount, :market_rate, :billing_address_id, :shipping_address_id,
                :is_active, :deleted_at

end
