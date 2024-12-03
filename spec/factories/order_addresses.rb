FactoryBot.define do
  factory :order_address do
    postal_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    region_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name {''}
    phone { Faker::Number.leading_zero_number(digits: 11) }
  end
end
