class CreateSubCategoryAttributes < ActiveRecord::Migration
  def change
    create_table :sub_category_attributes do |t|
      t.references :sub_category, index: true, foreign_key: true
      t.string :name
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
