FactoryBot.define do
  factory :color do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    code { Faker::Code.asin }
    is_active { Faker::Boolean.boolean }
  end
end