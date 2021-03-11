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
end
