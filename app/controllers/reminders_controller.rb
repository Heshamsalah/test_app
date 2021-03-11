class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[show update destroy]
  before_action :set_user, :set_ticket

  def index
    @reminders = Reminder.where(ticket_id: @ticket.id)
      .page(reminder_params[:page]).per(reminder_params[:per_page])
    json_response(@reminders)
  end

  def show
    json_response(@reminder)
  end

  def create
    @reminder = Reminder.new(reminder_filtered_params)

    if @reminder.save
      json_response(@reminder, :created)
    else
      json_response('Something went wrong', :internal_server_error)
    end
  end

  def update
    @reminder.update(reminder_filtered_params)
    head :no_content
  end

  def destroy
    @reminder.destroy
    head :no_content
  end

  private

  def reminder_params
    params.permit(
      :id,
      :user_id,
      :ticket_id,
      :status,
      :time,
      :page, :per_page
    )
  end

  def reminder_filtered_params
    reminder_params.except(:id, :user_id, :page, :per_page)
  end

  def set_reminder
    @reminder = Reminder.find(reminder_params[:id])
  end

  def set_user
    @user = User.find(reminder_params[:user_id])
  end

  def set_ticket
    @ticket = Ticket.find(reminder_params[:ticket_id])
  end
end
