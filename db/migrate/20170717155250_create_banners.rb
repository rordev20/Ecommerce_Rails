class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :target_url
      t.boolean :in_new_tab
      t.integer :position
      t.boolean :is_active, default: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :banners, :name
    add_index :banners, :start_date
    add_index :banners, :end_date
  end
end
