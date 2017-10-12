class Cart < ApplicationRecord
  acts_as_paranoid
  belongs_to :user, optional: true
  belongs_to :coupon, -> { includes(:discount_type)}, optional: true
  has_many :cart_items
  has_many :products, through: :cart_items

  # This method return list of cart items in cart
  def items_in_cart
    self.cart_items.includes(:product)
  end

  # Number of product in cart
  def product_in_cart
    self.cart_items.pluck(:quantity).sum
  end

  # This method return cart net total amount
  def self.get_cart_total(cart_data)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    cart_items.inject(0) {|sum, cart_item| sum + cart_item[:net_amount]}
  end

  # This method return cart data sorted by price
  def self.get_cart_data_sort_by_price(cart_data)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    cart_items.sort_by {|cart_item| cart_item[:net_amount]}
  end

  # This method return number of dishes in cart
  def self.get_no_of_dishes(cart_data)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    cart_items.inject(0) {|sum, cart_item| sum + cart_item[:quantity]}
  end

  # Thid method return number of cartitems
  def self.get_no_of_cart_items(cart_data)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    cart_items.size
  end

  # This method return value in cart data
  def self.get_items_from_cart_data(cart_data)
    cart_data.values.flatten
  end

  # This method give net discount
  def self.get_discount(cart_data, discount_type)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    cart_items.inject(0) {|sum, cart_item| sum + cart_item[discount_type.to_sym]}
  end

  # This method return grand total
  def self.get_grand_total(sub_total, discount)
    sub_total - discount
  end

  # This method set brownie point usage
  def set_brownie_point_usage(use_brownie_point)
    if use_brownie_point == "true"
      self.use_brownie_point = false
    else
      self.use_brownie_point = true
    end
    self.save!
    self
  end

    # This method return cart net total amount
  def self.get_wallet_used(cart_data)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    cart_items.inject(0) {|sum, cart_item| sum + cart_item[:brownie_point_used].to_i}
  end

  def get_cashback_discount_hash(cart_data)
    discount, cashback = 0, 0
    coupon = self.coupon
    if coupon
      cart_data = coupon.get_cart_data_for_coupon(cart_data, self)
      discount_type = coupon.is_cashback_coupon? ? Coupon.get_offer_type[:cashback] : Coupon.get_offer_type[:discount_amount]
    end
    if coupon && coupon.is_cashback_coupon?
      cashback = Cart.get_discount(cart_data, discount_type)
    elsif coupon
      discount = Cart.get_discount(cart_data, discount_type)
    end
    {discount: discount, cashback: cashback}
  end

  def set_coupon(coupon_id)
    self.coupon_id = coupon_id
    self.save!
  end

  def get_cart_item(params)
    if params[:size_id].present?
      cart_items.where(product_id: params[:product_id], size_id: params[:size_id].to_i).first_or_initialize
    else
      cart_items.where(product_id: params[:product_id]).first_or_initialize
    end
  end
end
