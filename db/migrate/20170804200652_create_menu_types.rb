class CreateMenuTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_types do |t|
      t.string :name, limit: 50, null: false
      t.string :slug
      t.boolean :is_active, null: false, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :menu_types, :name, where: "deleted_at IS NULL"
    add_index :menu_types, :slug, unique: true, where: "deleted_at IS NULL"
    add_index :menu_types, :deleted_at
  end
end
