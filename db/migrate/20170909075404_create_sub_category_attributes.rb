class CreateSubCategoryAttributes < ActiveRecord::Migration
  def change
    create_table :sub_category_attributes do |t|
      t.references :sub_category, index: true, foreign_key: true
      t.string :attribute_type
      t.string :name, limit: 50, null: false
      t.text :content
      t.integer :position
      t.boolean :is_active, null: false, default: false

      t.timestamps null: false
    end
    add_index :sub_category_attributes, :attribute_type
  end
end
