class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.string :slug
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :sub_categories, :name
    add_index :sub_categories, :slug, unique: true
  end
end
