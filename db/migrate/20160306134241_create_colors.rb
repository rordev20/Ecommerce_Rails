class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name,            limit: 40, null: false, unique: true
      t.string :code,            null: false, unique: true
      t.string :slug
      t.boolean :is_active,      null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :colors, :slug, unique: true
  end
end
