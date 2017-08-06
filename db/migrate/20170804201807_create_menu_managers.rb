class CreateMenuManagers < ActiveRecord::Migration
  def change
    create_table :menu_managers do |t|
      t.string :name
      t.string :display_name
      t.string :slug
      t.string :url
      t.boolean :open_in_new_tab
      t.integer :position
      t.references :menu_type, index: true, foreign_key: true
      t.boolean :sign_in_required
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :menu_managers, :name
    add_index :menu_managers, :slug, unique: true
  end
end
