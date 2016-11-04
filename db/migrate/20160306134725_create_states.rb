class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbr
      t.references :country, index: true, foreign_key: true
      t.boolean :is_active
      t.boolean :deleted_at

      t.timestamps null: false
    end
  end
end
