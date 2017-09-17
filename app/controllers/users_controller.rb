class UsersController < ApplicationController

  def orders
    current_user.orders
  end


end
