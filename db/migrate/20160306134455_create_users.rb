class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,           limit: 64, null: false
      t.string :phone_number,       limit: 20, null: false, unique: true
      t.float :brownie_point,       default: 0, null: false
      t.boolean :is_active,         null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :users, :deleted_at
  end
end
