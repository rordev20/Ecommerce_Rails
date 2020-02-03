FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    password { 'default_password' }
    password_confirmation { 'default_password' }
  end
end