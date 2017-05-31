class OrdersController < ApplicationController
  before_action :current_cart, only: [:new, :create]
  before_action :create_cart_data, only: [:new, :create]

  # new order page
  def new
    @order = Order.build_order_params(@cart_data, @cart, current_user)
    @countries = Country.list_of_countries
    @states = State.active
    @cart_items = @cart.items_in_cart
    @payment_methods = PaymentMethod.active
  end

  # create order
  def create
    begin
      order = Order.build_order_params(@cart_data, @cart, current_user)
      bill_address_same_as_ship = Address.address_billing_same_as_shipping?(params[:same_address])
      order_address_hash = current_user.save_user_address(bill_address_same_as_ship, build_bill_address_params, build_ship_address_params)
      order.set_address(bill_address_same_as_ship, order_address_hash)
      order.payment_method_id = params[:payment_method]
      if order.save!
        clear_sessions
      end
    rescue ActiveRecord::RecordInvalid => e
      logger.info e.message
      logger.info e.backtrace
      respond_to do |format|
        format.js { flash[:alert] = e.message }
        format.html {redirect_to new_order_path, alert: e.message and return}
      end
    end
    redirect_to confirm_order_path(order_id: order.id)
  end

  # This method show confirm order page
  def confirm_order
    @order = current_user.orders.includes(shipping_address: [:state, :country]).where(id: params[:order_id]).first
    @cart_items = @order.cart.cart_items
  end

  private

  def build_bill_address_params
    {country_id: params[:country].to_i, zipcode: params[:pincode], address1: params[:address_1], address2: params[:address_2], city: params[:city], state_id: params[:state].to_i, address_type_id: params[:address_type].to_i}
  end

  def build_ship_address_params
    {country_id: params[:shipping_country].to_i, zipcode: params[:shipping_pincode] , address1: params[:shipping_address_1], address2: params[:shipping_address_2], city: params[:shipping_city], state_id: params[:shipping_state].to_i, address_type_id: params[:ship_address_type].to_i}
  end
end
