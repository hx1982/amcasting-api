FactoryGirl.define do
  factory :member do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    gender_code { Faker::Lorem.word }
    member_type nil
    member_source_type nil
    account_status_type nil
    user nil
    is_active { Faker::Boolean.boolean }
    email { Faker::Internet.email}
    phone { Faker::PhoneNumber.cell_phone}
  end
end
