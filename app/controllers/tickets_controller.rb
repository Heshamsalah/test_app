# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show update destroy]
  before_action :set_user, only: %i[create]

  def index
    result = GetTicketsService.call(ticket_params)
    json_response(result.data)
  end

  def show
    json_response(@ticket)
  end

  def create
    result = CreateTicketService.call(ticket_params)
    if result.success && result.data.due_date.present?
      add_reminder(result.data)
      json_response(result.data, :created)
    else
      json_response('Something went wrong', :internal_server_error)
    end
  end

  def update
    @ticket.update(ticket_filtered_params)
    head :no_content
  end

  def destroy
    @ticket.destroy
    head :no_content
  end

  private

  def ticket_params
    params.permit(
      :id,
      :title,
      :description,
      :user_id,
      :assigned_user_id,
      :due_date,
      :page,
      :per_page
    )
  end

  def ticket_filtered_params
    ticket_params.except(:id, :user_id, :page, :per_page)
  end

  def set_ticket
    @ticket = Ticket.find(ticket_params[:id])
  end

  def set_user
    @user = User.find(ticket_params[:user_id])
  end

  def add_reminder(ticket)
    return unless ticket.user.send_due_date_reminder
    CreateReminderService.call({
      title: ticket.title, note: ticket.description, 
      due_date: ticket.due_date,
      remind_interval: ticket.user.due_date_reminder_interval, 
      reminderable: ticket
    })
  end
end
