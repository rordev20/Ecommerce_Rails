class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.string :name,           limit: 40, null: false
      t.string :payment_mode
      t.boolean :is_active,     null: false, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :payment_methods, :name, where: "deleted_at IS NULL"
    add_index :payment_methods, :deleted_at
  end
end
