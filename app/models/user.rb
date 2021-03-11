# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tickets
  has_many :reminders, through: :tickets
end
