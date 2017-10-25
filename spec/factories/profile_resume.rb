FactoryGirl.define do
  factory :profile_resume do
    profile nil
    file_path '/bar'
    file_name  'baz'
    description { Faker::Lorem.word }
    is_generated_by_credit { Faker::Boolean.boolean }
  end
end
