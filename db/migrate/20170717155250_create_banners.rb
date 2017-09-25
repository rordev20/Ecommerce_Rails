class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name, limit: 50, null: false
      t.text :description
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :target_url
      t.boolean :in_new_tab
      t.integer :position
      t.boolean :is_active, default: false, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :banners, :name, where: "deleted_at IS NULL"
    add_index :banners, :start_date, where: "deleted_at IS NULL"
    add_index :banners, :end_date, where: "deleted_at IS NULL"
    add_index :banners, :deleted_at
  end
end
