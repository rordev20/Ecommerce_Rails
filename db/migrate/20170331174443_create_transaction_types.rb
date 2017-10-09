class CreateTransactionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_types do |t|
      t.string :name,          limit: 40, null: false
      t.string :slug
      t.boolean :is_active,    null: false, default: true 
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :transaction_types, :slug, unique: true, where: "deleted_at IS NULL"
    add_index :transaction_types, :deleted_at
  end
end
