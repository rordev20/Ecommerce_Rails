class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_cart

  #This method return current cart
  def current_cart
    @cart = session[:cart_id].present? ? Cart.find_by_id(session[:cart_id]) : Cart.new
  end

  #This method create cart data for use
  def create_cart_data
    current_cart
    data_array = []
    cart_items = @cart.items_in_cart
    cart_items.each do |cart_item|
      per_item_cost = cart_item.prd_sell_price
      quantity = cart_item.quantity
      total_cost = cart_item.cart_item_total
      product_id = cart_item.prd_id
      discount_amount = 0
      cart_item_id = cart_item.id
      data_array << {per_item_cost: per_item_cost, quantity: quantity, total_cost: total_cost, net_amount: total_cost, product_id: product_id, discount_amount: discount_amount, cart_item_id: cart_item_id}
    end
    @cart_data = {@cart.id => data_array}
  end

end
