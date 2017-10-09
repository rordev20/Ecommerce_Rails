class CreateJoinTableProductSize < ActiveRecord::Migration[5.1]
  def change
    create_table :products_sizes, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :size, index: true
    end
  end
end
