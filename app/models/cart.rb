class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  has_many :cart_items
  has_many :products, through: :cart_items

  # This method return list of cart items in cart
  def items_in_cart
    self.cart_items.includes(product: :images)
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
end
