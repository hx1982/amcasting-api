FactoryGirl.define do
  factory :company do
    name { Faker::Lorem.word }
    number { Faker::Number.number(10) }
    company_type { Faker::Lorem.word }
  end
end
