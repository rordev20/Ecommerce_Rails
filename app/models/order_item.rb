class OrderItem < ApplicationRecord
  acts_as_paranoid
  include AASM

  enum status:  [ :draft, :confirmed, :dispatched, :delivered, :cancelled,
                 :returned, :refunded, :damaged, :not_delivered, :reordered
                ]
  belongs_to :order
  belongs_to :product
  has_many :images, through: :product

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

    event :confirm, after: [:update_product_quantity] do
      transitions from: [:draft], to: :confirmed
    end

    event :cancel, after: [:restore_product_quantity] do
      transitions from: [:confirmed, :dispatched, :delivered], to: :cancelled
    end
  end

  def self.build_order_items_attributes(cart_data)
    cart_items = Cart.get_items_from_cart_data(cart_data)
    order_items_array = []
    cart_items.each do |cart_item|
      raise CustomException::InsufficientInventory, cart_item[:product] if cart_item[:quantity] > cart_item[:product].quantity
      order_items_array << {
                            product: cart_item[:product],
                            quantity: cart_item[:quantity],
                            rate: cart_item[:per_item_cost],
                            net_amount: cart_item[:net_amount],
                            discount_amount: cart_item[:discount_amount],
                            cashback: cart_item[:cashback], 
                            brownie_point: cart_item[:brownie_point_used]
                          }
    end
    order_items_array
  end

  def sufficient_product_quantity
    raise CustomException::InsufficientInventory, self.product unless self.orderable?
  end

  def orderable?
    self.product.quantity >= self.quantity
  end

  def update_product_quantity
    product.sell_count = product.sell_count + self.quantity
    product.save!
  end

  def restore_product_quantity
    product.sell_count = product.sell_count - self.quantity
    product.save!
  end
end
