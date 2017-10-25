FactoryGirl.define do
  factory :superannuation do
    company { Faker::Lorem.characters(10)}
    number { Faker::Number.number(10) }
    social_security_number { Faker::Number.number(10) }
  end
end
