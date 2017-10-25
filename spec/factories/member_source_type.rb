FactoryGirl.define do
  factory :member_source_type do
    code { Faker::Lorem.characters(3)}
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    sequence(:sequence)
  end
end
