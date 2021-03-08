require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  test "create_ticket" do
    ticket = create(:ticket)
    assert ticket
  end
end
