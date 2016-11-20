ActiveAdmin.register CurrencyRate do

  permit_params :country, :rate, :market_rate, :is_active, :deleted_at

end
