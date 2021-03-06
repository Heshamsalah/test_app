# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def reminder_email
    @ticket = params[:ticket]
    mail(
      to: @ticket.user.email,
      subject: "Remider | due dated ticket #{@ticket.id}"
    )
  end
end
