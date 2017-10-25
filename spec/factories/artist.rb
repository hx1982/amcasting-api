FactoryGirl.define do
  factory :artist do
    dob { Faker::Date.backward(14) }
    is_dob_visible { Faker::Boolean.boolean  }
    passport_number { Faker::Number.number(10) }
    age_from { Faker::Number.between(1, 10) }
    age_to { Faker::Number.between(20, 30) }
    is_age_range_auto_update { Faker::Boolean.boolean }
    member nil
    company nil
    is_company_legal_entity { Faker::Boolean.boolean  }
    tax nil
    superannuation nil
    bank_account nil
  end
end
