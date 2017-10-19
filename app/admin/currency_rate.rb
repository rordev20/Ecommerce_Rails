ActiveAdmin.register CurrencyRate do

  permit_params :country_id, :rate, :market_rate, :is_active, :deleted_at

  controller do
    def scoped_collection
      super.includes :country
    end
  end

end
