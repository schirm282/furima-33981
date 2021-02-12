FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"相原"}
    first_name            {"藍"}
    last_frigana          {"アイハラ"}
    first_frigana         {"アイ"}
    birthday              {"2000/01/01"}
  end
end