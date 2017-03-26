class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :limit
      t.datetime :start_date
      t.datetime :end_date
      t.string :code
      t.references :coupon_type, index: true, foreign_key: true
      t.float :percent_off
      t.float :flat_off
      t.float :minimum_amount
      t.references :discount_type, index: true, foreign_key: true
      t.integer :use_count
      t.integer :maximum_discount
      t.boolean :is_cashback
      t.boolean :app_only
      t.boolean :only_for_new_user
      t.boolean :discount_with_cashback_offer
      t.boolean :products_specific
      t.text :product_ids
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :coupons, :name
    add_index :coupons, :code
  end
end
