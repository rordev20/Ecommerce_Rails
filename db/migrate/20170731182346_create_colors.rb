class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :code
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
