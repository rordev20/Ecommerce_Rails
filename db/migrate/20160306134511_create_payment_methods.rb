class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :name,           limit: 40, null: false
      t.string :payment_mode
      t.boolean :is_active,     null: false, default: false

      t.timestamps null: false
    end
    add_index :payment_methods, :name
  end
end
