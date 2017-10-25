FactoryGirl.define do
  factory :medium_detail do
    medium nil
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
  end
end
