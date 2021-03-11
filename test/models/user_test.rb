# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(attributes_for(:user))
    assert user.valid?
  end

  test 'user has reminders through tickets' do
    user = create(:user, :reminders_on, :with_tickets)

    assert_equal user.reminders.count, 3
  end
end
