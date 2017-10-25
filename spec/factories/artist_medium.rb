FactoryGirl.define do
  factory :artist_medium do
    artist nil
    medium nil
    sequence(:sequence)
  end
end
