# frozen_string_literal: true

class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :job_id
      t.datetime :time
      t.string :status
      t.integer :ticket_id

      t.timestamps
    end
  end
end
