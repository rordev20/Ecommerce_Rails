FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    dimension { Faker::Measurement.metric_height }
    sequence(:description) { |n| "#{Faker::Name.name}#{n}" }
    original_price { Faker::Number.positive.round(2)  }
    purchase_price { Faker::Number.positive.round(2)  }
    sell_price { Faker::Number.positive.round(2)  }
    sub_category
    is_active { Faker::Boolean.boolean }
    color
    quantity { Faker::Number.digit }
    vendor
    in_stock { Faker::Boolean.boolean }
  end
end