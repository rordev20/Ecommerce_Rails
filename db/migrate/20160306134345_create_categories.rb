class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :categories, :name
  end
end
