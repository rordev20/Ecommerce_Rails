class Order < ApplicationRecord
  acts_as_paranoid
  include AASM
  enum status: [ :draft, :confirmed, :dispatched, :delivered, :cancelled,
                 :returned, :refunded, :damaged, :not_delivered, :reordered
               ]

  enum source: [ :web, :pwa ]
  belongs_to :user
  belongs_to :cart
  belongs_to :payment_status, optional: true
  belongs_to :billing_address, foreign_key: :billing_address_id, class_name: 'Address'
  belongs_to :shipping_address, foreign_key: :shipping_address_id, class_name: 'Address'
  belongs_to :payment_method
  has_many :order_items
  accepts_nested_attributes_for :order_items

  validates :cart, presence: true
  validates :user, presence: true
  validates :billing_address, presence: true
  validates :shipping_address, presence: true
  validates :total, presence: true
  validates :grand_total, presence: true
  validates :payment_method, presence: true
  before_save :set_fields
  after_save :update_user_wallet

  aasm column: :status, enum: true do
    state :draft, initial: true
    state :confirmed
    state :dispatched
    state :delivered
    state :cancelled
    state :returned
    state :refunded
    state :damaged
    state :not_delivered
    state :reordered

    event :confirm, before: [:check_product_availability], after: [:confirm_order_items] do
      transitions from: :draft, to: :confirmed
    end

    event :cancel, after: [:cancel_order_items] do
      transitions from: [:confirmed, :dispatched, :delivered], to: :cancelled
    end
  end

  def set_fields
    self.date = Date.today
  end

  # This method set user billing and shipping address
  def set_address(bill_address_same_as_ship, order_address_hash)
    self.billing_address_id = order_address_hash[:bill_address].id
    if bill_address_same_as_ship
      self.shipping_address_id = order_address_hash[:bill_address].id
    else
      self.shipping_address_id = order_address_hash[:ship_address].id
    end
  end

  # This method build order params by cart data
  def self.build_order_params(cart_data, cart, current_user)
    total = Cart.get_cart_total(cart_data)
    cashback_discount_hash = cart.get_cashback_discount_hash(cart_data)
    cashback, discount = cashback_discount_hash[:cashback], cashback_discount_hash[:discount]
    {
      total: total,
      discount: discount,
      brownie_point: current_user.get_user_used_wallet_amount(cart, cart_data),
      cashback: cashback,
      grand_total: Cart.get_cart_total(cart_data),
      cart: cart,
      user: current_user,
      order_items_attributes: OrderItem.build_order_items_attributes(cart_data)
    }
  end

  # This method set user wallet after order creation
  def update_user_wallet
    user = self.user
    user.brownie_point -= self.brownie_point
    user.save!
  end

  def check_product_availability
    order_items = self.order_items.includes(:product)
    order_items.map(&:sufficient_product_quantity)
  end

  def confirm_order_items
    order_items.each { |order_item| order_item.confirm! }
  end

  def cancel_order_items
    order_items.each do |order_item|
      order_item.cancel!
    end
  end
end
