class AddAttachmentToBannerDeviceTypes < ActiveRecord::Migration[5.1]
  def up
    add_attachment :banners, :image
  end

  def down
    remove_attachment :banners, :image
  end
end
