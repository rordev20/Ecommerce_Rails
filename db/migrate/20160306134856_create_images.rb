class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product, index: true, foreign_key: true
      t.string :photo
      t.references :vendor, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :sub_category, index: true, foreign_key: true
      t.integer :position
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
