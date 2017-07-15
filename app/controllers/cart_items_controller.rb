class CartItemsController < ApplicationController
  before_action :current_cart, only: [:create, :update, :destroy, :increase_quantity, :decrease_quantity]
  #This method create user cart item
  def create
    @cart_item = @cart.cart_items.where(product_id: cart_item_params[:product_id]).first_or_initialize
    @cart_item.quantity = @cart_item.quantity.to_i + cart_item_params[:quantity].to_i
    @cart_item.save!
    session[:cart_id] = @cart.id
  end

  #This method update user cart item 
  def update
    @cart = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
  end

  def increase_quantity
    cart_item = @cart.cart_items.where(product_id: params[:id]).first
    cart_item.increment!(:quantity)
    respond_to do |format|
      format.js { redirect_to apply_coupon_path(cart: 'added'), alert: t('cart_item.added') and return }
    end
  end

  def decrease_quantity
    cart_item = @cart.cart_items.where(product_id: params[:id]).first
    cart_item.decrement!(:quantity)
    respond_to do |format|
      format.js { redirect_to apply_coupon_path(cart: 'decreased'), alert: t('cart_item.decreased') and return }
    end
  end

  #This method destroy user cart item
  def destroy
    @cart_item = @cart.cart_items.where(id: params[:id])
    CartItem.destroy @cart_item.map { |ci| ci.id }
    @cart_items = @cart.items_in_cart
  end
private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
