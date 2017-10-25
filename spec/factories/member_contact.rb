FactoryGirl.define do
  factory :member_contact do
    member nil
    contact nil
    is_primary { Faker::Boolean.boolean }
    is_visible { Faker::Boolean.boolean }
    sequence(:sequence)
  end
end
