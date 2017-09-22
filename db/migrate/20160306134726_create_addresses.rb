class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :full_name,        limit: 64, null: false
      t.string :address1,         null: false
      t.string :address2
      t.string :landmark
      t.string :city
      t.string :zipcode,          null: false
      t.references :state, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.references :address_type, index: true, foreign_key: true
      t.string :phone
      t.string :alt_phone
      t.references :vendor, index: true, foreign_key: true
      t.boolean :is_active,        null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
