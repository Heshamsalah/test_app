# frozen_string_literal: true

# This model was added as an approach to keep track of the reminders the user
# creates and operate on them, like giving the user the ability to control
# reminders by adding the ability to delete them, which will require finding
# the created job and delete it.
class Reminder < ApplicationRecord
  belongs_to :reminderable, polymorphic: true

  after_create :schedule_job

  validates_presence_of :title, :due_date, :remind_interval

  def user
    reminderable.user
  end

  # TODO: Add a before_destroy method to handle unscheduling the reminder job.

  private
    def schedule_job
      interval = user.due_date_reminder_interval
      date = DateTime.parse(due_date.to_s) - interval
      job = ReminderJob.set(wait_until: date).perform_later(reminderable)
      job_id = job.job_id
      save
    end
end
