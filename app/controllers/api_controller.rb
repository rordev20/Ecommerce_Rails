class ApiController < ActionController::API

  #This method return current cart
  def current_cart
    @cart = params[:cart_reference].present? ? Cart.find_by_client_cart_reference(params[:cart_reference]) : Cart.new
  end

  #This method create cart data for use
  def create_cart_data
    @cart_data = {cart_reference: @cart.client_cart_reference, cart_count: @cart.product_in_cart, cart_data: @cart.cart_data_with_images}
  end

  # dummmy user
  def current_user
    @user ||= User.last
  end

end