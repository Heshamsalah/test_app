# frozen_string_literal: true

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'should queue reminder email' do
    @ticket = create(:ticket, :with_due_date)
    email = UserMailer.with(ticket: @ticket).reminder_email

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['from@example.com'], email.from
    assert_equal [@ticket.user.mail.to_s], email.to
    assert_equal "Remider | due dated ticket #{@ticket.id}", email.subject
  end
end
