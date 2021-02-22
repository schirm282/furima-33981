FactoryBot.define do
  factory :address do
    postal_code             {123-0845}
    delivery_source_area_id {14}
    municipality            {足立区 西新井本町}
    house_number            {1−1}
    building                {}
    phone_number            {08012345678}
    record_id               {1}
  end
end
