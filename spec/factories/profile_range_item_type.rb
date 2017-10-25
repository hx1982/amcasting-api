FactoryGirl.define do
  factory :profile_range_item_type_value do
    min { Faker::Number.between(1, 10) }
    max { Faker::Number.between(1, 10) }
    step { Faker::Number.between(1, 10) }
    profile_item_type nil
    profile_item_type_code { Faker::Lorem.characters(3)}
  end
end
