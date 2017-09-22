class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name,          limit: 40, null: false
      t.string :slug
      t.boolean :is_active,    null: false, default: false 
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :events, :slug, unique: true
  end
end
