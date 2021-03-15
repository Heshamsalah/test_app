# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :ticketable, polymorphic: true, optional: true
  belongs_to :user, foreign_key: 'created_by'
  has_many :reminders, as: :reminderable

  def assigned_user=(usr)
    self.assigned_user_id = usr.id
    save!
  end

  def assigned_user
    nil || User.where(id: assigned_user_id).first
  end

  after_create :add_reminder

  private

  def add_reminder
    return unless user.send_due_date_reminder && due_date.present?
    interval = user.due_date_reminder_interval
    date = DateTime.parse(due_date.to_s) - interval
    job = TicketsDueDateReminderJob.set(wait_until: date).perform_later(self)
    reminders.create(
      title: title, note: description, due_date: date,
      remind_interval: interval, job_id: job.job_id
    )
  end
end
