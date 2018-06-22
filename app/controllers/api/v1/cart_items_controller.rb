class Api::V1::CartItemsController < ApiController
  before_action :current_cart, only: [:create]

  def create
    begin
      @cart_item = @cart.get_cart_item(cart_item_params)
      @cart_item.save_cart_item(cart_item_params)
      render json: create_cart_data, status: :created, code: 201
    rescue CustomException::SizeMissing => e
      logger.info e.message
      logger.info e.backtrace
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  private

  def cart_item_params
    params.permit(:product_id, :quantity)
  end
end
