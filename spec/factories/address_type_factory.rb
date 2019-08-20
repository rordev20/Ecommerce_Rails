FactoryBot.define do
  factory :address_type do
    name ["billing_address", "shipping_address"].sample
  end
end