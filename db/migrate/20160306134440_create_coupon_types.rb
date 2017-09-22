class CreateCouponTypes < ActiveRecord::Migration
  def change
    create_table :coupon_types do |t|
      t.string :name,        limit: 40, null: false, unique: true
      t.boolean :is_active,  null: false, default: true

      t.timestamps null: false
    end
  end
end
