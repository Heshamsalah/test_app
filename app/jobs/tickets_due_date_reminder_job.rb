class TicketsDueDateReminderJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    # Do something later
    "Email Sent to #{ticket.user.mail}... "
  end
end
