class OrdersController < ApplicationController
  before_action :current_cart, only: [:new, :create]
  before_action :create_cart_data, only: [:new, :create]

  # new order page
  def new
    @countries = Country.list_of_countries
  end

  # create order
  def create
    order = current_user.orders.new
    order.total = Cart.get_cart_total(@cart_data)
    order.cart_id = @cart.id
    if order.save!
      clear_sessions
    end
    redirect_to root_path
  end

  private

  def ship_address_params
    {country_id: params[:country].to_i , address1: params[:address_1], address2: params[:address_2], city: params[:city], state_id: params[:state].to_i, zipcode: params[:pincode]}
  end
end
