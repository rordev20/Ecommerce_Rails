FactoryBot.define do
  factory :color do
    name Faker::Name.name
    code Faker::Code.asin
    is_active Faker::Boolean.boolean
  end
end