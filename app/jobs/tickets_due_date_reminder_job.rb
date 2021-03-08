class TicketsDueDateReminderJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    # Do something later
  end
end
