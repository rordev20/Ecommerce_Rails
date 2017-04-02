class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.float :total
      t.float :grand_total
      t.float :shipping
      t.references :order_status, index: true, foreign_key: true
      t.string :number
      t.references :payment_status, index: true, foreign_key: true
      t.float :cod_charge
      t.references :cart, index: true, foreign_key: true
      t.float :currency_rate
      t.references :payment_method, index: true, foreign_key: true
      t.text :notes
      t.float :discount
      t.float :cashback
      t.float :brownie_point
      t.float :market_rate
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :orders, :number
  end
end
