FactoryBot.define do
  factory :ticket do
    title { Faker::Name.name }
    description  { Faker::Internet.email }
    user

    trait :with_due_date do
      due_date { Faker::Date.forward(days: 23)}
    end
  end
end