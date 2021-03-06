# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_15_035900) do

  create_table "reminders", force: :cascade do |t|
    t.string "title"
    t.text "note"
    t.datetime "due_date"
    t.integer "remind_interval"
    t.string "job_id"
    t.string "reminderable_type", null: false
    t.integer "reminderable_id", null: false
    t.index ["reminderable_type", "reminderable_id"], name: "index_reminders_on_reminderable_type_and_reminderable_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "due_date"
    t.integer "status_id"
    t.integer "progress"
    t.string "ticketable_type"
    t.integer "ticketable_id"
    t.integer "created_by"
    t.integer "assigned_user_id"
    t.index ["ticketable_type", "ticketable_id"], name: "index_tickets_on_ticketable_type_and_ticketable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "send_due_date_reminder"
    t.integer "due_date_reminder_interval"
    t.time "due_date_reminder_time"
    t.string "time_zone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"mail\"", name: "index_users_on_mail"
  end

end
