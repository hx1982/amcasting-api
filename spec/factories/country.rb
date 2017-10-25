FactoryGirl.define do
  factory :country do
    name { Faker::Lorem.word }
    country_code { Faker::Lorem.word }
  end
end
