class CreateDiscountTypes < ActiveRecord::Migration
  def change
    create_table :discount_types do |t|
      t.string :name,        null: false, unique: true
      t.boolean :is_active,  null: false, default: true

      t.timestamps null: false
    end
  end
end
