FactoryBot.define do
  factory :address_type do
    #name { ["billing_address", "shipping_address"].sample }
    initialize_with { AddressType.find_or_initialize_by(name: ["billing_address", "shipping_address"].sample) }
  end
end