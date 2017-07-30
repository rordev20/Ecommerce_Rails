class CreatePriceRanges < ActiveRecord::Migration
  def change
    create_table :price_ranges do |t|
      t.float :min_price
      t.float :max_price
      t.references :sub_category, index: true, foreign_key: true
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
