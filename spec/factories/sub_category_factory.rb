FactoryBot.define do
  factory :sub_category do
    sequence(:name) { |n| "#{Faker::Name.unique.name}#{n}" }
    description { Faker::Name.name }
    category
    is_active { Faker::Boolean.boolean }
  end
end