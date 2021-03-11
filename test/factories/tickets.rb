# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence }
    user { create(:user, :reminders_on) }

    trait :with_due_date do
      due_date { Faker::Date.forward(days: 23) }
    end
  end
end