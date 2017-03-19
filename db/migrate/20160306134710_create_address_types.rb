class CreateAddressTypes < ActiveRecord::Migration
  def self.up
    create_table :address_types do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :address_types, :name
    AddressType.create(name: 'billing_address')
    AddressType.create(name: 'shipping_address')
  end

  def self.down
    drop_table :address_types
  end	
end
