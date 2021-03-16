# frozen_string_literal: true

class ReminderJob < ApplicationJob
  queue_as :default

  def perform(object)
    UserMailer.with(object: object).reminder_email.deliver_now
    # We can add multiple notification methods here:
    # SMS
    # Push Notifications (with firebase for example)
    # Whatsapp integration
    # ....
  end
end
