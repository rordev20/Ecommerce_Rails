module Mapper
  class AddressData
    def initialize(address)
      @address = address
    end

    def map
      {
        full_name: @address.full_name,
        address1: @address.address1,
        address2: @address.address2,
        landmark: @address.landmark,
        city: @address.city,
        zipcode: @address.zipcode,
        state_id: @address.state_id,
        country_id: @address.country_id
      }
    end
  end
end



