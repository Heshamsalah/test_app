# frozen_string_literal: true

class Reminder < ApplicationRecord
  belongs_to :ticket

  #Todo: Add a before_destroy method to handle unscheduling the reminder job.
end
