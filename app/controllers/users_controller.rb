class UsersController < ApplicationController

  def orders
    @orders = current_user.get_orders
  end

  def addresses
    @addresses = current_user.addresses.includes(:country, :state)
  end

end
