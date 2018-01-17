ActiveAdmin.register CurrencyRate do
  menu parent: "Master", priority: 3 

  permit_params :country_id, :rate, :market_rate, :is_active, :deleted_at

  controller do
    def scoped_collection
      super.includes :country
    end
  end

end
