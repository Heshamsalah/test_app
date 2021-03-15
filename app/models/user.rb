# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tickets, foreign_key: :created_by
  has_many :reminders, through: :tickets

  def assigned_tickets
    Ticket.where(assigned_user_id: id)
  end
end
