FactoryGirl.define do
  factory :profile_skill do
    profile nil
    skill nil
    level {Faker::Number.between(1, 3) }
  end
end
