FactoryGirl.define do
  factory :address_location_type do
    code { Faker::Lorem.characters(3)}
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    sequence(:sequence)
  end
end
