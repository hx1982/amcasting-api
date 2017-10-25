FactoryGirl.define do
  factory :address do
    address_location_type nil
    address_type nil
    country nil
    state nil
    city nil
    street { Faker::Lorem.word }
    post_code { Faker::Lorem.word }
  end
end
