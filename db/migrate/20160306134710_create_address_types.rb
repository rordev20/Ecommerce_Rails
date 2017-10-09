class CreateAddressTypes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :address_types do |t|
      t.string :name,        limit: 40, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :address_types, :name, where: "deleted_at IS NULL"
    add_index :address_types, :deleted_at
  end

  def self.down
    drop_table :address_types
  end	
end
