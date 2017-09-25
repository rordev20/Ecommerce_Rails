class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name,  limit: 40, null: false
      t.references :category, index: true, foreign_key: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :sizes, :deleted_at
  end
end
