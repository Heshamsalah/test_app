class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.text :note
      t.datetime :due_date
      t.integer :remind_interval
      t.string :job_id
      t.references :reminderable, polymorphic: true, null: false
    end
  end
end
