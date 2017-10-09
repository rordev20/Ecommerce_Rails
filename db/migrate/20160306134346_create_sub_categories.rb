class CreateSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_categories do |t|
      t.string :name,            limit: 50, null: false, unique: true
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.string :slug
      t.boolean :is_active,      null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :sub_categories, :name, where: "deleted_at IS NULL"
    add_index :sub_categories, :slug, unique: true, where: "deleted_at IS NULL"
    add_index :sub_categories, :deleted_at
  end
end
