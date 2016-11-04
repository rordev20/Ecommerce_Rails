class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.references :order, index: true, foreign_key: true
      t.text :note
      t.references :vendor_order, index: true, foreign_key: true
      t.string :state
      t.boolean :is_active
      t.boolean :deleted_at

      t.timestamps null: false
    end
  end
end
