class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name,          limit: 40, null: false
      t.string :slug
      t.boolean :is_active,    null: false, default: false 
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :events, :slug, unique: true, where: "deleted_at IS NULL"
    add_index :events, :deleted_at
  end
end
