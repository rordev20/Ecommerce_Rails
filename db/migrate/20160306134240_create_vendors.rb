class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.text :description
      t.text :policy
      t.boolean :is_whole_seller
      t.float :rate
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :vendors, :name
    add_index :vendors, :email
  end
end
