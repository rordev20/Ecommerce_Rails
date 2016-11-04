class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :email
      t.boolean :user
      t.references :coupon, index: true, foreign_key: true
      t.boolean :is_active
      t.boolean :deleted_at

      t.timestamps null: false
    end

    add_index :carts, :email
  end
end
