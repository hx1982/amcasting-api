FactoryGirl.define do
  factory :skill do
    skill_group nil
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
    is_searchable { Faker::Boolean.boolean }
    sequence(:sequence)
  end
end
