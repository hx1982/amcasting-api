FactoryGirl.define do
  factory :state do
    name { Faker::Lorem.word }
    country_code { Faker::Lorem.word }
    country nil
  end
end
