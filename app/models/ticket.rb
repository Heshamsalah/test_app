# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user, foreign_key: 'assigned_user_id'

  after_create :add_reminder

  private

  def add_reminder
    return unless user.send_due_date_reminder && due_date.present?

    interval = user.due_date_reminder_interval
    date = DateTime.parse(due_date.to_s) - interval
    TicketsDueDateReminderJob.set(wait_until: date).perform_later(self)
  end
end
