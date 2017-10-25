FactoryGirl.define do
  factory :profile_value_item_type_value do
    name { Faker::Lorem.word }
    sequence(:sequence)
    level1 { Faker::Number.between(1, 10) }
    level2 { Faker::Number.between(1, 10) }
    profile_item_type_code { Faker::Lorem.characters(3)}
    profile_item_type nil
  end
end
