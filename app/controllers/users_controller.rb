class UsersController < ApplicationController

  def orders
    @orders = current_user.get_orders
  end

end
