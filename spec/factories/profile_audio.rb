FactoryGirl.define do
  factory :profile_audio do
    profile nil
    artist_medium nil
    is_primary { Faker::Boolean.boolean  }
    sequence(:sequence)
  end
end
