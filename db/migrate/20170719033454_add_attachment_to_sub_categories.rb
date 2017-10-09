class AddAttachmentToSubCategories < ActiveRecord::Migration[5.1]
  def up
    add_attachment :sub_categories, :image
  end

  def down
    remove_attachment :sub_categories, :image
  end
end
