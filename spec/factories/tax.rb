FactoryGirl.define do
  factory :tax do
    tax_type nil
    juristiction { Faker::Lorem.word}
    number { Faker::Lorem.word }
  end
end
