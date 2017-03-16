class OrdersController < ApplicationController
  before_action :current_cart, only: [:new, :create]
  before_action :create_cart_data, only: [:new, :create]

  # new order page
  def new
    @order = Order.new
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

end
