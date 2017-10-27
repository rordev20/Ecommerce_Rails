FactoryBot.define do
  factory :vendor do
    name Faker::Name.name
    email Faker::Internet.email
  end
end