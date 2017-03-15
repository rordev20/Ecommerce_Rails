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
    @cart_data = {}
  end
end
