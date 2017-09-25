class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name,          limit: 40, null: false
      t.string :iso_code
      t.string :iso_name
      t.boolean :is_active,    null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :countries, :name, where: "deleted_at IS NULL"
    add_index :countries, :iso_code, where: "deleted_at IS NULL"
    add_index :countries, :deleted_at
  end
end
