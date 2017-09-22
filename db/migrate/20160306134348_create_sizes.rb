class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name,  limit: 40, null: false
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
