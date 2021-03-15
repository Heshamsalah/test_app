# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(attributes_for(:user))
    assert user.valid?
  end

  test 'user has reminders through tickets' do
    user = create(:user, :reminders_on)
    tickets = create_list(:ticket, 3, :with_due_date, user: user)
    tickets.each do |ticket|
      create(:reminder, reminderable: ticket)
    end

    assert_equal user.reminders.count, 3
  end
end
