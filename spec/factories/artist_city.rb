FactoryGirl.define do
  factory :artist_city do
    artist nil
    city nil
    is_primary { Faker::Boolean.boolean }
    sequence(:sequence)
  end
end
