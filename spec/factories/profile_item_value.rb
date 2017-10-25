FactoryGirl.define do
  factory :profile_item_value do
    profile_item nil
    conversion nil
    profile_value_item_type_value nil
    value { Faker::Number.between(1, 10) }
  end
end
