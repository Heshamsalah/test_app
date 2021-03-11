# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence }
    user

    trait :with_due_date do
      due_date { Faker::Date.forward(days: 23) }
    end

    trait :with_reminders do
      reminders { create_list(:reminder, 1) }
    end
  end
end
