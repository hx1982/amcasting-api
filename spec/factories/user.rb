FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    password { Faker::Lorem.characters(8) }
  end
end
