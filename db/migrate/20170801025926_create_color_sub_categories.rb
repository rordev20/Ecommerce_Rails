class CreateColorSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :color_sub_categories do |t|
      t.references :color, index: true, foreign_key: true
      t.references :sub_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
