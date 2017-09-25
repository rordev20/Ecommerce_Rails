class CreateBrowniePointTransactions < ActiveRecord::Migration
  def change
    create_table :brownie_point_transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.float :points, default: 0, null: false
      t.references :event, index: true, foreign_key: true
      t.references :transaction_type, index: true, foreign_key: true
      t.text :comment
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :brownie_point_transactions, :deleted_at
  end
end
