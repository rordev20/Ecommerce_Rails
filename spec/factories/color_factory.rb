FactoryBot.define do
  factory :color do
    name Faker::Name.name
    code Faker::Code.asin
  end
end