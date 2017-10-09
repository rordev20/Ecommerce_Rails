class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :name,           limit: 40, null: false
      t.integer :limit,         default: 0
      t.datetime :start_date,   null: false
      t.datetime :end_date,     null: false
      t.string :code,           limit: 40, null: false, unique: true
      t.references :coupon_type, index: true, foreign_key: true
      t.float :percent_off,     default: 0.0
      t.float :flat_off,        default: 0.0
      t.float :minimum_amount,  default: 0.0
      t.references :discount_type, index: true, foreign_key: true
      t.integer :use_count,     default: 0
      t.integer :maximum_discount, default: 0
      t.boolean :is_cashback,   default: false
      t.boolean :app_only,      default: false
      t.boolean :only_for_new_user,   default: false
      t.boolean :discount_with_cashback_offer,   default: false
      t.boolean :products_specific,   default: false
      t.text :product_ids
      t.boolean :is_active,     null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :coupons, :name, where: "deleted_at IS NULL"
    add_index :coupons, :code, where: "deleted_at IS NULL"
    add_index :coupons, :deleted_at
  end
end
