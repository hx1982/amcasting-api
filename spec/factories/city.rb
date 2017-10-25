FactoryGirl.define do
  factory :city do
    name { Faker::Lorem.word  }
    state nil
  end
end
