class Coupon < ActiveRecord::Base
  just_define_datetime_picker :start_date
  just_define_datetime_picker :end_date
  belongs_to :coupon_type
  belongs_to :discount_type
  OFFER_TYPE = { discount_amount: 'discount_amount', cashback: 'cashback' }.freeze

  # This method check if coupon is applicable or not
  def applicability
  end

  # This method get flat or percentage discount
  def get_cart_data_for_coupon(cart_data, cart)
    case self.discount_type.name
    when 'flat'
      self.get_flat_discount(cart_data, cart)
    when 'percentage'
      self.get_percentage_discount(cart_data, cart)
    end
  end

  # This method calculate flat discount
  def get_flat_discount(cart_data, cart)
    discount, cashback = 0, 0
    array_of_discounted_item = []
    sorted_cart_data = Cart.get_cart_data_sort_by_price(cart_data)
    discount_amount = self.flat_off
    dish_count = Cart.get_no_of_cart_items(cart_data)
    sorted_cart_data.each do |cart_item|
      distribute_amount = (discount_amount.to_f/dish_count.to_f)
      if is_cashback_coupon?
        cashback = get_each_product_flat_cashback(cart_item, distribute_amount, dish_count)
        discount_amount = discount_amount - cashback
      else
        discount = get_each_product_flat_discount(cart_item, distribute_amount, dish_count)
        discount_amount = discount_amount - discount
      end
      dish_count = dish_count - 1
      cart_item = get_discounted_cart_item(cart_item, discount, cashback)
      array_of_discounted_item << cart_item
    end
    {cart.id => array_of_discounted_item}
  end

  # This method calculate percentage discount
  def get_percentage_discount(cart_data, cart)
    discount, cashback = 0, 0
    array_of_discounted_item = []
    discount_percent = self.percent_off
    cart_data_values = Cart.get_items_from_cart_data(cart_data)
    cart_data_values.each do |cart_item|
    if is_cashback_coupon?
      cashback = get_each_product_percentage_discount(cart_item, discount_percent)
    else
      discount = get_each_product_percentage_discount(cart_item, discount_percent)
    end
      cart_item = get_discounted_cart_item(cart_item, discount, cashback)
      array_of_discounted_item << cart_item
    end
    {cart.id => array_of_discounted_item}
  end

  # This method calculate flat discount for each product
  def get_each_product_flat_discount(cart_item, distribute_discount_amount, dish_count)
    discount = cart_item[:net_amount] < distribute_discount_amount ? cart_item[:net_amount] : distribute_discount_amount
    dish_count == 1 ? discount.ceil : discount.floor
  end

  # This method calculate cashback for each product
  def get_each_product_flat_cashback(cart_item, distribute_caskback_amount, dish_count)
    cashback = cart_item[:total_cost] < distribute_caskback_amount ? cart_item[:total_cost] : distribute_caskback_amount
    cashback = dish_count == 1 ? cashback.ceil : cashback.floor
  end

  # This method calculate percentage discount for each product
  def get_each_product_percentage_discount(cart_item, discount_percent)
    cart_item[:net_amount].to_f*(discount_percent.to_f/100.0)
  end

  # This method set cart data after discount
  def get_discounted_cart_item(cart_item, discount, cashback)
    cart_item[:net_amount] = cart_item[:net_amount] - discount
    cart_item[:discount_amount] = discount
    cart_item[:cashback] = cashback
    cart_item
  end

  def self.get_offer_type
    Coupon::OFFER_TYPE
  end

  # This method check if coupon is cash back
  def is_cashback_coupon?
    self.is_cashback == true
  end

  # This method check if coupon is only applicable for app
  def for_app_only?
    self.app_only == true
  end

  # This method check if coupon is only for new user
  def is_only_for_new_user?
    self.only_for_new_user == true
  end

  # This method check coupon with discount as well as cashback
  def is_discount_with_cashback_offer?
    self.discount_with_cashback_offer == true
  end
end
