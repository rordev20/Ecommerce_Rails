class CreateCouponTypes < ActiveRecord::Migration
  def change
    create_table :coupon_types do |t|
      t.string :name,        limit: 40, null: false, unique: true
      t.boolean :is_active,  null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :coupon_types, :deleted_at
  end
end
