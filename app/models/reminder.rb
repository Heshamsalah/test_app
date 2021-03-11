# frozen_string_literal: true

class Reminder < ApplicationRecord
  belongs_to :ticket
end
