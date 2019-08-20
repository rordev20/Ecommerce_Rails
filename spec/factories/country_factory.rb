FactoryBot.define do
  factory :country do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    sequence(:iso_code) { |n| "#{Faker::Name.name}#{n}" }
    sequence(:iso_name) { |n| "#{Faker::Name.name}#{n}" }
  end
end