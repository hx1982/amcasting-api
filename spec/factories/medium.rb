FactoryGirl.define do
  factory :medium do
    medium_type nil
    file_path '/bar'
    file_name 'baz'
    file_type { Faker::File.mime_type }
    file_size { Faker::Number.between(1, 10) }
    duration {Faker::Number.decimal(2) }
  end
end
