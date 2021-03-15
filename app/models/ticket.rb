# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :ticketable, polymorphic: true, optional: true
  belongs_to :user, foreign_key: :created_by
  has_many :reminders, as: :reminderable

  def assigned_user=(usr)
    self.assigned_user_id = usr.id
    save!
  end

  def assigned_user
    nil || User.where(id: assigned_user_id).first
  end
end
