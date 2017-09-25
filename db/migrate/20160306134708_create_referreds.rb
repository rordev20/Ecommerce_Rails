class CreateReferreds < ActiveRecord::Migration
  def change
    create_table :referreds do |t|
      t.string :name,           limit: 64, null: false
      t.string :email,          limit: 40, unique: true
      t.string :phone_no,       limit: 20, null: false
      t.references :referrer, index: true, foreign_key: true
      t.boolean :is_active,     null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :referreds, :name, where: "deleted_at IS NULL"
    add_index :referreds, :email, where: "deleted_at IS NULL"
    add_index :referreds, :deleted_at
  end
end
