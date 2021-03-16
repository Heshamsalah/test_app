class CreateReminderService < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    reminder = Reminder.create!(
      title: @params[:title], note: @params[:note], 
      due_date: @params[:due_date],
      remind_interval: @params[:remind_interval],
      reminderable: @params[:reminderable]
    )
    result(true, reminder)
  rescue StandardError => e
    result(false, e)
  end
end