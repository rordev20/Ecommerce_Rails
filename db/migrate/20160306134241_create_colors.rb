class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :code
      t.string :slug
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :colors, :slug, unique: true
  end
end
