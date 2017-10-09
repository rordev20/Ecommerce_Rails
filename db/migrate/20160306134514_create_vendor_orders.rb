class CreateVendorOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_orders do |t|
      t.references :vendor, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :state
      t.string :payment_state
      t.float :total
      t.references :coupon, index: true, foreign_key: true
      t.text :notes
      t.datetime :confirmed_at
      t.float :discount
      t.float :shipping
      t.float :market_rate
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.references :cart, index: true, foreign_key: true
      t.string :number
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :vendor_orders, :state
    add_index :vendor_orders, :payment_state
    add_index :vendor_orders, :number
  end
end
