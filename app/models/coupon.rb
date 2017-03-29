class Coupon < ActiveRecord::Base
  just_define_datetime_picker :start_date
  just_define_datetime_picker :end_date
  belongs_to :coupon_type
  belongs_to :discount_type
  OFFER_TYPE = { discount_amount: 'discount_amount', cashback: 'cashback' }.freeze

  # This method check if coupon is applicable or not
  def is_applicable?(cart_data)
    return false if is_expired?
    return false if is_cart_value_greater_than_coupon_min?(cart_data)
    return false if maximum_quantity_reached?
    true
  end

  # This method check if coupon is in valid datetime range
  def is_expired?
    if self.start_date < Time.now && self.end_date > Time.now
      false
    else
      self.errors.add(:base, I18n.t('coupon.error_message.expired'))
      true
    end
  end

  # This method check for cart minimum value for coupon to be applied
  def is_cart_value_greater_than_coupon_min?(cart_data)
    if Cart.get_cart_total(cart_data) > self.minimum_amount.to_i
      false
    else
      self.errors.add(:base, I18n.t('coupon.error_message.min_cart_value', minimum_value: self.minimum_amount.to_i))
      true
    end
  end

  # This method check coupon usage limit
  def maximum_quantity_reached?
    if self.limit > self.use_count
      false
    else
      self.errors.add(:base, I18n.t('coupon.error_message.maximum_quantity_reached'))
      true
    end
  end

  # This method get flat or percentage discount
  def get_cart_data_for_coupon(cart_data, cart)
    case self.discount_type.name
    when I18n.t('coupon.discount_type.flat')
      self.get_flat_discount(cart_data, cart)
    when I18n.t('coupon.discount_type.percentage')
      self.get_percentage_discount(cart_data, cart)
    end
  end

  # This method calculate flat discount
  def get_flat_discount(cart_data, cart)
    discount, cashback = 0, 0
    array_of_discounted_item = []
    sorted_cart_data = Cart.get_cart_data_sort_by_price(cart_data)
    discount_amount = get_maximum_discount_amount(cart_data)
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
    net_discount_amount = net_amount_percentage_discount(cart_data)
    if net_discount_amount > self.maximum_discount && maximum_discount_is_set
      self.get_flat_discount(cart_data, cart)
    else
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

  # This method return net percentage discount
  def net_amount_percentage_discount(cart_data)
    net_amount = Cart.get_cart_total(cart_data)
    discount_percent = self.percent_off
    net_amount.to_f*(discount_percent.to_f/100.0)
  end

  # This method return maximum cart discount
  def get_maximum_discount_amount(cart_data)
    case self.discount_type.name
    when I18n.t('coupon.discount_type.flat')
      self.flat_off
    when I18n.t('coupon.discount_type.percentage')
      net_discount_amount = net_amount_percentage_discount(cart_data)
      net_discount_amount > self.maximum_discount && maximum_discount_is_set ? self.maximum_discount : net_discount_amount
    end
  end

  # maximum_discount_is_set
  def maximum_discount_is_set
    self.maximum_discount > 0
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
