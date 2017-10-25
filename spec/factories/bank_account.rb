FactoryGirl.define do
  factory :bank_account do
    bank_name { Faker::Bank.name }
    bank_swift_code { Faker::Bank.swift_bic}
    bank_location { Faker::Address.street_name}
    account_name { Faker::Lorem.word }
    account_number { Faker::Number.number(10)}
  end
end
