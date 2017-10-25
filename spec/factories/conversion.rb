FactoryGirl.define do
  factory :conversion do
    uk_value  { Faker::Number.between(1, 10) }
    us_value  { Faker::Number.between(1, 10) }
    eu_value  { Faker::Number.between(1, 10) }
    au_value  { Faker::Number.between(1, 10) }
    fr_value  { Faker::Number.between(1, 10) }
    sequence(:sequence)
    profile_item_type_code { Faker::Lorem.characters(3)}
    profile_item_type nil
  end
end
