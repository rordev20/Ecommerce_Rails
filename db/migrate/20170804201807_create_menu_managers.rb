class CreateMenuManagers < ActiveRecord::Migration
  def change
    create_table :menu_managers do |t|
      t.string :name, limit: 50, null: false
      t.string :display_name
      t.string :slug
      t.string :url
      t.boolean :open_in_new_tab
      t.integer :position
      t.references :menu_type, index: true, foreign_key: true
      t.string :icon_class
      t.boolean :sign_in_required, null: false, default: false
      t.boolean :is_active, null: false, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :menu_managers, :name
    add_index :menu_managers, :slug, unique: true
  end
end
