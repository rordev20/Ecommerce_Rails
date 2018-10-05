class AddClientCartReferenceToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :client_cart_reference, :string
    add_index :carts, :client_cart_reference
  end
end
