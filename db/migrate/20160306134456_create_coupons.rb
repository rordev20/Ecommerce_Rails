class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :limit
      t.datetime :start_date
      t.datetime :end_date
      t.string :code
      t.float :percent_off
      t.float :flat_off
      t.float :minimum_amount
      t.string :coupon_type
      t.integer :use_count
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :coupons, :name
    add_index :coupons, :code
  end
end
