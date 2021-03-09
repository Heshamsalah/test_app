FactoryBot.define do
  factory :ticket do
    title { Faker::Name.name }
    description  { Faker::Lorem.sentence }
    assigned_user_id { create(:user, :reminders_on).id }

    trait :with_due_date do
      due_date { Faker::Date.forward(days: 23)}
    end
  end
end