# frozen_string_literal: true

FactoryBot.define do
  factory :reminder do
    time { '2021-03-11 04:52:13' }
    status { 'Active' }
    ticket
  end
end
