class CreatePriceRanges < ActiveRecord::Migration
  def change
    create_table :price_ranges do |t|
      t.float :min_price, default: 0,  null: false
      t.float :max_price, default: 0,  null: false
      t.references :sub_category, index: true, foreign_key: true
      t.boolean :is_active, null: false, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
