require 'test_helper'

class TicketsDueDateReminderJobTest < ActiveJob::TestCase
  test "Email sent" do
    ticket = create(:ticket, :with_due_date)
    r = TicketsDueDateReminderJob.perform_now(ticket)
    assert_equal r, "Email Sent to #{ticket.user.mail}... "
  end
end
