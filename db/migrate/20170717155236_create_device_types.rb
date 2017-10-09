class CreateDeviceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :device_types do |t|
      t.string :name, limit: 40, null: false
      t.boolean :is_active, default: false, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :device_types, :name, where: "deleted_at IS NULL"
    add_index :device_types, :deleted_at
  end
end
