class CreateReferrers < ActiveRecord::Migration[5.1]
  def change
    create_table :referrers do |t|
      t.string :name,           limit: 64, null: false
      t.string :email,          limit: 40, unique: true
      t.string :phone_no,       limit: 20, null: false
      t.boolean :is_active,     null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :referrers, :name, where: "deleted_at IS NULL"
    add_index :referrers, :email, where: "deleted_at IS NULL"
    add_index :referrers, :deleted_at
  end
end
