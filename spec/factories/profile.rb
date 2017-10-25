FactoryGirl.define do
  factory :profile do
    artist nil
    is_billing_profile { Faker::Boolean.boolean  }
    is_active { Faker::Boolean.boolean  }
  end
end
