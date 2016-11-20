class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :dimension
      t.text :description
      t.integer :price
      t.references :vendor, index: true, foreign_key: true
      t.references :sub_category, index: true, foreign_key: true
      t.integer :quantity
      t.string :color
      t.integer :domestic_pos
      t.integer :international_pos
      t.text :specification
      t.string :product_code
      t.float :weight
      t.integer :sell_count
      t.text :notes
      t.integer :clicks
      t.integer :discount_percent
      t.float :discount_amount
      t.boolean :in_stock
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :products, :name
    add_index :products, :price
    add_index :products, :color
  end
end
