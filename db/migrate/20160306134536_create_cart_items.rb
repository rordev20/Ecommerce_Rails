class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity,          default: 0, null: false
      t.references :size, index: true, foreign_key: true
      t.text :note
      t.references :vendor_order, index: true, foreign_key: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :cart_items, :deleted_at
  end
end
