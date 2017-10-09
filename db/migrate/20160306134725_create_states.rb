class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name,          limit: 40, null: false
      t.string :abbr
      t.references :country, index: true, foreign_key: true
      t.boolean :is_active,    null: false, default: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :states, :deleted_at
  end
end
