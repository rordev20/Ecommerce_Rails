class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.float :rate
      t.float :net_amount
      t.float :discount_amount, default: 0
      t.float :brownie_point, default: 0
      t.float :cashback, default: 0


      t.timestamps null: false
    end
  end
end
