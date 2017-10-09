class CreateBannerDeviceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :banner_device_types do |t|
      t.references :banner, index: true, foreign_key: true
      t.references :device_type, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
