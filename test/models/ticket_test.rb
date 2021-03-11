# frozen_string_literal: true

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  test 'create_ticket' do
    ticket = create(:ticket, :with_due_date)
    interval = ticket.user.due_date_reminder_interval
    date = DateTime.parse(ticket.due_date.to_s) - interval

    assert_enqueued_with(job: TicketsDueDateReminderJob, at: date)
    assert_equal ticket.reminders.count, 1
    assert_equal DateTime.parse(ticket.reminders.first.time.to_s), date
  end
end
