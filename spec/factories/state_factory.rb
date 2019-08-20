FactoryBot.define do
  factory :state do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    country
  end
end