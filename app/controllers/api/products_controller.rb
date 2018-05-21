class Api::ProductsController < ApiController
  before_action :set_product, only: [:show]

  def index
    @products = Product.filter(product_params)
    render json: { products:
      @products.map do |product|
        Mapper::ProductData.new(product).map
      end
    }
  end

  def show
    render json: { product: Mapper::ProductData.new(@product).map }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(product_params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.permit(:id, :sub_category)
  end
end
