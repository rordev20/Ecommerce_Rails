class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.float :total
      t.float :shipping
      t.string :state
      t.string :number
      t.references :coupon, index: true, foreign_key: true
      t.string :payment_state
      t.float :cod_charge
      t.references :cart, index: true, foreign_key: true
      t.float :currency_rate
      t.string :pay_type
      t.text :notes
      t.float :discount
      t.float :market_rate
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.boolean :is_active
      t.boolean :deleted_at

      t.timestamps null: false
    end
    add_index :orders, :state
    add_index :orders, :number
    add_index :orders, :payment_state
  end
end
