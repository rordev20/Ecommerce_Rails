class CreateMenuTypes < ActiveRecord::Migration
  def change
    create_table :menu_types do |t|
      t.string :name
      t.string :slug
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :menu_types, :name
    add_index :menu_types, :slug, unique: true
  end
end
