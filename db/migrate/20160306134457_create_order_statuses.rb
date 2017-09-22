class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :name,           limit: 40, null: false
      t.boolean :is_active,     null: false, default: true
      t.timestamps null: false
    end
  end
end
