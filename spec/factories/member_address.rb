FactoryGirl.define do
  factory :member_address do
    member nil
    address nil
    is_primary { Faker::Boolean.boolean }
    is_visible { Faker::Boolean.boolean }
    sequence(:sequence)
  end
end
