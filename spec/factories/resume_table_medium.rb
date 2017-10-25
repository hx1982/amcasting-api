FactoryGirl.define do
  factory :resume_table_medium do
    row { Faker::Number.between(1, 10) }
    sequence(:sequence)
    artist_medium nil
    resume_table nil
  end
end
