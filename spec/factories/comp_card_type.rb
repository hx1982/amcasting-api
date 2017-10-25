FactoryGirl.define do
  factory :comp_card_type do
    code { Faker::Lorem.characters(3)}
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    sequence(:sequence)
  end
end
