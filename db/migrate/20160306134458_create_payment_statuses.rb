class CreatePaymentStatuses < ActiveRecord::Migration
  def change
    create_table :payment_statuses do |t|
      t.string :name,           limit: 40, null: false
      t.boolean :is_active,     null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :payment_statuses, :deleted_at
  end
end
