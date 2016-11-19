class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :address1
      t.string :address2
      t.string :landmark
      t.string :city
      t.string :zipcode
      t.boolean :active
      t.references :state, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.string :phone
      t.string :alt_phone
      t.references :vendor, index: true, foreign_key: true
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
