class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name,            limit: 50, null: false
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.string :slug
      t.boolean :is_active,      null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :sub_categories, :name
    add_index :sub_categories, :slug, unique: true
  end
end
