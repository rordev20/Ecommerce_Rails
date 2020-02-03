FactoryBot.define do
  factory :address do
    full_name { Faker::Name.first_name }
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.street_address }
    zipcode { Faker::Address.zip_code }
    city { Faker::Address.city }
    state
    country
    address_type
    user
  end
end