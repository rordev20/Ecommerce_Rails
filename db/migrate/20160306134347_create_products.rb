class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name,                   limit: 100, null: false
      t.string :dimension
      t.text :description
      t.decimal :purchase_price,        precision: 8, scale: 2
      t.decimal :original_price,        precision: 8, scale: 2, null: false
      t.decimal :sell_price,            precision: 8, scale: 2, null: false
      t.references :vendor, index: true, foreign_key: true
      t.references :sub_category, index: true, foreign_key: true
      t.references :color, index: true, foreign_key: true
      t.integer :quantity,              null: false
      t.integer :domestic_pos,          null: false
      t.integer :international_pos,     null: false
      t.text :specification
      t.string :product_code,           null: false, unique: true
      t.float :weight
      t.integer :sell_count,            default: 0,  null: false
      t.text :notes
      t.integer :clicks,                default: 0,  null: false
      t.integer :discount_percent,      default: 0,  null: false
      t.boolean :in_stock,              null: false, default: false
      t.string :slug
      t.boolean :is_active,             null: false, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :products, :name, where: "deleted_at IS NULL"
    add_index :products, :sell_price, where: "deleted_at IS NULL"
    add_index :products, :slug, unique: true, where: "deleted_at IS NULL"
    add_index :products, :deleted_at
  end
end
