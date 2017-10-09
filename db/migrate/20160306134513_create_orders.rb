class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.decimal :total,        precision: 8, scale: 2, null: false
      t.decimal :grand_total,  precision: 8, scale: 2, null: false
      t.decimal :shipping,     precision: 8, scale: 2, default: 0
      t.date :date,            null: false
      t.integer :status
      t.string :number
      t.references :payment_status, index: true, foreign_key: true
      t.float :cod_charge,    default: 0
      t.references :cart, index: true, foreign_key: true
      t.decimal :currency_rate,  precision: 8, scale: 2
      t.references :payment_method, index: true, foreign_key: true
      t.text :notes
      t.decimal :discount,       precision: 8, scale: 2, default: 0
      t.decimal :cashback,       precision: 8, scale: 2, default: 0
      t.decimal :brownie_point,  precision: 8, scale: 2, default: 0
      t.decimal :market_rate,    precision: 8, scale: 2
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :orders, :number, where: "deleted_at IS NULL"
    add_index :orders, :deleted_at
  end
end
