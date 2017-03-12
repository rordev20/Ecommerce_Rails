ActiveAdmin.register Order do

  permit_params :user, :total, :shipping, :order_status, :number, :coupon, :payment_status, :cod_charge, :cart,
                :currency_rate, :pay_type, :notes, :discount, :market_rate, :billing_address_id, :shipping_address_id,
                :is_active, :deleted_at

end
