class CartItemsController < ApplicationController
  before_action :current_cart, only: [:create, :update, :destroy]

  #This method create user cart item
  def create
    @cart_item = @cart.cart_items.new(cart_item_params)
    @cart.save!
    session[:cart_id] = @cart.id
  end

  #This method update user cart item 
  def update
    @cart = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
  end

  #This method destroy user cart item
  def destroy
    @cart_item = @cart.cart_items.where(id: params[:item_ids])
    CartItem.destroy @cart_item.map { |ci| ci.id }
    @cart_items = CartItem.get_item_list_in_cart(@cart.cart_items.pluck(:id))
  end
private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
