ActiveAdmin.register Order do
  actions :all, :except => [:new]
  menu parent: "Order Details", priority: 1

  permit_params :user, :total, :shipping, :status, :number, :payment_status, :cod_charge, :cart,
                :currency_rate, :pay_type, :notes, :discount, :market_rate, :billing_address_id, :shipping_address_id,
                :is_active

end
