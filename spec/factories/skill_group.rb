FactoryGirl.define do
  factory :skill_group do
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
    sequence(:sequence)
  end
end
