class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.integer :position
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
