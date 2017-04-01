class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :brownie_point, default: 0
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
