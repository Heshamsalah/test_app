# frozen_string_literal: true

require 'test_helper'

class TicketsDueDateReminderJobTest < ActiveJob::TestCase
  test 'Job performed' do
    @ticket = create(:ticket, :with_due_date)
    assert_enqueued_jobs 1 do
      TicketsDueDateReminderJob.perform_later(@ticket)
    end
  end
end
