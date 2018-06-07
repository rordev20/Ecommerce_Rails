class ApiController < ActionController::API

  #This method return current cart
  def current_cart
    @cart = params[:cart_id].present? ? Cart.find_by_id(params[:cart_id]) : Cart.new
  end

  #This method create cart data for use
  def create_cart_data
    @cart_data = {cart_count: @cart.product_in_cart, cart_data: @cart.build_cart_data}
  end

end