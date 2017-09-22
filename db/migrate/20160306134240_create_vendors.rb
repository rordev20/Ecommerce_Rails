class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name,            limit: 50, null: false
      t.string :email,           null: false
      t.text :description
      t.text :policy
      t.boolean :is_whole_seller
      t.decimal :rate,           precision: 8, scale: 2
      t.boolean :is_active,      null: false, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :vendors, :name
    add_index :vendors, :email
  end
end
