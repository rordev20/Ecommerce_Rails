class CreateReferrers < ActiveRecord::Migration
  def change
    create_table :referrers do |t|
      t.string :name
      t.string :email
      t.string :phone_no

      t.timestamps null: false
    end
    add_index :referrers, :name
    add_index :referrers, :email
  end
end
