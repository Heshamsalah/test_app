# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.integer :status_id
      t.integer :progress
      t.references :ticketable, polymorphic: true, optional: true
      t.integer :created_by
      t.integer :assigned_user_id
    end
  end
end
