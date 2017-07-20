class CreateBannerCountries < ActiveRecord::Migration
  def change
    create_table :banner_countries do |t|
      t.references :banner, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
