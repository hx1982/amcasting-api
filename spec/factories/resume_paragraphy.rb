FactoryGirl.define do
  factory :resume_paragraphy do
    title { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    sequence(:sequence)
    profile_resume nil
  end
end
