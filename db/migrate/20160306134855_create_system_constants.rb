class CreateSystemConstants < ActiveRecord::Migration
  def change
    create_table :system_constants do |t|
      t.string :name
      t.string :value
      t.text :description
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :system_constants, :name
  end
end
