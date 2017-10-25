FactoryGirl.define do
  factory :profile_item_type do
    code { Faker::Lorem.characters(3)}
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    gender_code { Faker::Lorem.characters(3)}
    age_code { Faker::Lorem.characters(3)}
    type_code { Faker::Lorem.characters(3)}
    sequence(:sequence)
  end
end
