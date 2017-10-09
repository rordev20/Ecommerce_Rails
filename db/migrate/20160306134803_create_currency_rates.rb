class CreateCurrencyRates < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_rates do |t|
      t.references :country, index: true, foreign_key: true
      t.decimal :rate,            precision: 8, scale: 2
      t.decimal :market_rate,     precision: 8, scale: 2
      t.boolean :is_active,       null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :currency_rates, :deleted_at
  end
end
