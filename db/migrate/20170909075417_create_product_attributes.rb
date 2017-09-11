class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.references :product, index: true, foreign_key: true
      t.references :sub_category_attribute, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.integer :position
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
