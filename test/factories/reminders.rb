# frozen_string_literal: true

FactoryBot.define do
  factory :reminder do
    for_ticket # default if not trait is provided

    title { Faker::Lorem.word }
    note { Faker::Lorem.sentence }
    due_date { Faker::Time.forward(days: 2, period: :morning) }
    remind_interval { 0 }

    trait :for_ticket do
      association :reminderable, factory: :ticket
    end

    # create a trait for other resources that support reminders
    # ....
  end
end
