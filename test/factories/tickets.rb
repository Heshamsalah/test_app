# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence }
    association :user, factory: [:user, :reminders_on]

    trait :with_due_date do
      due_date { Faker::Date.forward(days: 23) }
    end
  end
end
