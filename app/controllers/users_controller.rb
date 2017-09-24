class UsersController < ApplicationController

  def orders
    @orders = current_user.get_orders
  end

  def addresses
    @addresses = current_user.addresses.includes(:country, :state)
  end

  def wallet
    @wallet_transactions = current_user.brownie_point_transactions
  end

  def account
  end

  def update
    redirect_to user_account_path
  end

  def my_coupon
  end
end
