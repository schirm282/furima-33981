FactoryBot.define do
  factory :item do
    association :user
    name                    { Faker::Name.name }
    explanation             { 'example' }
    category_id             { 2 }
    state_id                { 2 }
    delivery_fee_id         { 2 }
    delivery_source_area_id { 2 }
    days_to_delivery_id     { 2 }
    price                   { 500 }

  end
end
