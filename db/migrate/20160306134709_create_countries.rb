class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso_code
      t.string :iso_name
      t.boolean :is_active
      t.boolean :deleted_at

      t.timestamps null: false
    end
    add_index :countries, :name
    add_index :countries, :iso_code
  end
end
