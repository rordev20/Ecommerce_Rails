class CreateCurrencyRates < ActiveRecord::Migration
  def change
    create_table :currency_rates do |t|
      t.references :country, index: true, foreign_key: true
      t.float :rate
      t.float :market_rate
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
