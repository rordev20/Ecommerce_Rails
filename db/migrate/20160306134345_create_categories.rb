class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name,            limit: 50, null: false, unique: true
      t.text :description
      t.string :slug
      t.boolean :is_active,      null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :categories, :name, where: "deleted_at IS NULL"
    add_index :categories, :slug, unique: true, where: "deleted_at IS NULL"
    add_index :categories, :deleted_at
  end
end
