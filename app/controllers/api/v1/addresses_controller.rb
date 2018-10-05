class Api::V1::AddressesController < ApiController

  def index
    addresses = current_user.addresses
    render json: { addresses:
      addresses.map do |address|
        Mapper::AddressData.new(address).map
      end
    }
  end

  def create
    address = Address.new(address_params)
    ## HARDCODE VALUES BELOW need to be removed once use authentication is developed
    address.user = current_user
    address.address_type = AddressType.first
    if address.save
      render json: address, status: :created, code: 201
    else
    end
  end

  private

  def address_params
    params.permit(:full_name, :zipcode, :address1, :city, :state_id, :country_id)
  end

end
