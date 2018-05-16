FactoryBot.define do
  factory :category do
    name Faker::Name.name
    description Faker::Name.name
    is_active Faker::Boolean.boolean
  end
end