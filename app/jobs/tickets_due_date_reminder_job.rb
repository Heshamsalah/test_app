# frozen_string_literal: true

class TicketsDueDateReminderJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    # Do something later
    # check if the user.send_due_date_reminder is still true.
    return unless ticket.user.send_due_date_reminder

    UserMailer.with(ticket: ticket).reminder_email.deliver_now
    # We can add multiple notification methods here:
    # SMS
    # Push Notifications (with firebase for example)
    # Whatsapp integration
    # ....
  end
end
