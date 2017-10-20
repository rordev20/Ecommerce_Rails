class CreateProductSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sizes do |t|
      t.references :product, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true
      t.integer :quantity, default: 0
      t.timestamps null: false
    end
  end
end
