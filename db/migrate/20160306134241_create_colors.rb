class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.string :name,            limit: 40, null: false, unique: true
      t.string :code,            null: false, unique: true
      t.string :slug
      t.boolean :is_active,      null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :colors, :slug, unique: true, where: "deleted_at IS NULL"
    add_index :colors, :deleted_at
  end
end
