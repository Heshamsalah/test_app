# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user, foreign_key: 'assigned_user_id'
  has_many :reminders

  after_create :add_reminder

  private

  def add_reminder
    return unless user.send_due_date_reminder && due_date.present?

    interval = user.due_date_reminder_interval
    date = DateTime.parse(due_date.to_s) - interval
    job = TicketsDueDateReminderJob.set(wait_until: date).perform_later(self)
    reminders.create(job_id: job.job_id, time: date)
  end
end
