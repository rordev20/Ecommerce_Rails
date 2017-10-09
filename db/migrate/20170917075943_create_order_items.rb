class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :rate, precision: 8, scale: 2, null: false
      t.decimal :net_amount, precision: 8, scale: 2, null: false 
      t.decimal :discount_amount, precision: 8, scale: 2, default: 0
      t.decimal :brownie_point,  precision: 8, scale: 2, default: 0
      t.decimal :cashback, precision: 8, scale: 2, default: 0
      t.datetime :delivery_date
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :order_items, :deleted_at
  end
end
