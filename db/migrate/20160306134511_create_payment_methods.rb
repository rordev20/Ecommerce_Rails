class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.string :payment_mode
      t.boolean :is_active

      t.timestamps null: false
    end
    add_index :payment_methods, :name
  end
end
