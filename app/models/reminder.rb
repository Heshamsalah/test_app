# frozen_string_literal: true

# This model was added as an approach to keep track of the reminders the user
# creates and operate on them, like giving the user the ability to control 
# reminders by adding the ability to delete them, which will require finding 
# the created job and delete it.
class Reminder < ApplicationRecord
  belongs_to :reminderable, polymorphic: true

  #Todo: Add a before_destroy method to handle unscheduling the reminder job.
end
