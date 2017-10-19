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
    data_array = []
    @cart_items = @cart.items_in_cart
    @cart_items.each do |cart_item|
      per_item_cost = cart_item.prd_sell_price
      quantity = cart_item.quantity
      total_cost = cart_item.cart_item_total
      product = cart_item.product
      cart_item_id = cart_item.id
      data_array << {per_item_cost: per_item_cost, quantity: quantity, total_cost: total_cost, net_amount: total_cost, product: product, discount_amount: 0, cart_item_id: cart_item_id, brownie_point_used: 0, cashback: 0}
    end
    @cart_data = {@cart.id => data_array}
  end

  # clear session variables
  def clear_sessions
    session.delete(:cart_id)
  end

  # This method set cart data
  def set_cart_data
    current_cart
    create_cart_data
    @sub_total = Cart.get_cart_total(@cart_data)
  end

  # This method get list of category
  def get_category_list
    @categories = Category.get_categories_sub_categories_list
  end

  def set_country_rate
    currency_code = request.headers['COUNTRY']
    currency_rate = Country.get_rate(currency_code)
    unless currency_rate.present?
      currency_code = SystemConstant.get_value('default_country')
      currency_rate = SystemConstant.get_value('default_conversion_rate')
    end
    @country_rate = CountryCurrencyRate.new({currency_rate: currency_rate, currency_code: currency_code})
  end

end
