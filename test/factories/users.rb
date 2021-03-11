# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    mail  { Faker::Internet.email }

    trait :reminders_on do
      send_due_date_reminder { true }
      due_date_reminder_interval { Faker::Number.between(from: 0, to: 10) }
      due_date_reminder_time do
        Faker::Time.between(from: DateTime.now, to: DateTime.now + 1)
      end
      time_zone { 'Europe/Vienna' }
    end
  end
end
