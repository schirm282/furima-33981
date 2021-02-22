FactoryBot.define do
  factory :record_address do
    postal_code             { "123-4567" }
    delivery_source_area_id { 14 }
    municipality            { "足立区西新井本町" }
    house_number            { "123" }
    phone_number            { "12345678901" }
    record_id               { 1 }
    item_id                 { 1 }
    user_id                 { 1 }
  end
end
