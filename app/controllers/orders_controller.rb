class OrdersController < ApplicationController
  before_action :current_cart, only: [:new, :create]
  before_action :create_cart_data, only: [:new, :create]

  # new order page
  def new
    @countries = Country.list_of_countries
    @states = State.active
    @cart_items = @cart.items_in_cart
    @payment_methods = PaymentMethod.active
  end

  # create order
  def create
    order = current_user.orders.new
    order.total = Cart.get_cart_total(@cart_data)
    order.cart_id = @cart.id
    bill_address_same_as_ship = Address.address_billing_same_as_shipping?(params[:same_address])
    order_address_hash = current_user.save_user_address(bill_address_same_as_ship, build_bill_address_params, build_ship_address_params)
    order.set_address(bill_address_same_as_ship, order_address_hash)
    order.payment_method_id = params[:payment_method]
    if order.save!
      clear_sessions
    end
    redirect_to confirm_order_path(order_id: order.id)
  end

  def confirm_order
    @order = current_user.orders.find(params[:order_id])
  end

  private

  def build_bill_address_params
    {country_id: params[:country].to_i, zipcode: params[:pincode], address1: params[:address_1], address2: params[:address_2], city: params[:city], state_id: params[:state].to_i, address_type_id: params[:address_type].to_i}
  end

  def build_ship_address_params
    {country_id: params[:shipping_country].to_i, zipcode: params[:shipping_pincode] , address1: params[:shipping_address_1], address2: params[:shipping_address_2], city: params[:shipping_city], state_id: params[:shipping_state].to_i, address_type_id: params[:ship_address_type].to_i}
  end
end
