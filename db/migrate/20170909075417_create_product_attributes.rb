class CreateProductAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attributes do |t|
      t.references :product, index: true, foreign_key: true
      t.references :sub_category_attribute, index: true, foreign_key: true
      t.string :name, limit: 50, null: false
      t.string :description
      t.integer :position
      t.boolean :is_active, null: false, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :product_attributes, :deleted_at
  end
end
