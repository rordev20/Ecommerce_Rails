class CreateDiscountTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :discount_types do |t|
      t.string :name,        null: false, unique: true
      t.boolean :is_active,  null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :discount_types, :deleted_at
  end
end
