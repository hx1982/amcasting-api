FactoryGirl.define do
  factory :resume_table_cell do
    row { Faker::Number.between(1, 10) }
    column { Faker::Number.between(1, 10) }
    text { Faker::Lorem.word }
    resume_table nil
  end
end
