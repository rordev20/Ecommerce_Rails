class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
      t.string :name, limit: 50, null: false
      t.float :rate, default: 0.0,  null: false
      t.references :sub_category, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true      
      t.float :min_range
      t.float :max_range
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :taxes, :name, where: "deleted_at IS NULL"
    add_index :taxes, :min_range, where: "deleted_at IS NULL"
    add_index :taxes, :max_range, where: "deleted_at IS NULL"
  end
end
