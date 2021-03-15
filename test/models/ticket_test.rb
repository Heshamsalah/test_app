# frozen_string_literal: true

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  test 'valid ticket' do
    user = create(:user)
    ticket = Ticket.new(
      attributes_for(:ticket, :with_due_date).merge(created_by: user.id)
    )

    assert ticket.valid?
  end
end
