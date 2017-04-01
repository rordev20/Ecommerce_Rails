class CreateBrowniePointTransactions < ActiveRecord::Migration
  def change
    create_table :brownie_point_transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.float :points
      t.references :event, index: true, foreign_key: true
      t.references :transaction_type, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
