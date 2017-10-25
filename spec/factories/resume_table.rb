FactoryGirl.define do
  factory :resume_table do
    title { Faker::Lorem.word }
    row { Faker::Number.between(1, 10) }
    column { Faker::Number.between(1, 10) }
    sequence(:sequence)
    profile_resume nil
  end
end
