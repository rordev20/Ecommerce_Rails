class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string :name
      t.boolean :is_active, default: false

      t.timestamps null: false
    end
    add_index :device_types, :name
  end
end
