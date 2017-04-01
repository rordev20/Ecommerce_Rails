class CreateTransactionTypes < ActiveRecord::Migration
  def change
    create_table :transaction_types do |t|
      t.string :name
      t.string :slug
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :transaction_types, :slug, unique: true
  end
end
