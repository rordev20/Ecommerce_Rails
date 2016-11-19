class CreateReferreds < ActiveRecord::Migration
  def change
    create_table :referreds do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.references :referrer, index: true, foreign_key: true
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :referreds, :name
    add_index :referreds, :email
  end
end
