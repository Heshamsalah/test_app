# frozen_string_literal: true

require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  test 'valid reminder' do
    ticket = create(:ticket, :with_due_date)
    reminder = Reminder.new(
      attributes_for(:reminder).merge({ ticket_id: ticket.id })
    )
    assert reminder.valid?
  end

  test 'delete reminder and its corresponding job' do
    ticket = create(:ticket, :with_due_date)
    reminder = ticket.reminders.first
    reminder.destroy
    assert_raises(ActiveRecord::RecordNotFound) { reminder.reload }
  end
end
