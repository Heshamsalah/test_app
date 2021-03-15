# frozen_string_literal: true

require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  test 'valid reminder' do
    ticket = create(:ticket, :with_due_date)
    reminder = Reminder.new(
      attributes_for(:reminder).merge(
        reminderable_id: ticket.id, 
        reminderable_type: ticket.class.name
      )
    )
    assert reminder.valid?
  end

  test 'delete reminder' do
    ticket = create(:ticket, :with_due_date)
    reminder = ticket.reminders.first
    reminder.destroy
    assert_raises(ActiveRecord::RecordNotFound) { reminder.reload }
    assert_equal ticket.reminders.count, 0
  end
end
