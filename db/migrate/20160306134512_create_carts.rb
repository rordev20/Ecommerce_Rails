class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :email
      t.references :coupon, index: true, foreign_key: true
      t.boolean :use_brownie_point, default: true
      t.boolean :is_active,     null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :carts, :email, where: "deleted_at IS NULL"
    add_index :carts, :deleted_at
  end
end
