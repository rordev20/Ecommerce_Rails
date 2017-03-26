class CreateDiscountTypes < ActiveRecord::Migration
  def change
    create_table :discount_types do |t|
      t.string :name
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
