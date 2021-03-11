# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show update destroy]
  before_action :set_user, only: %i[create]

  def index
    @tickets = Ticket.page(ticket_params[:page]).per(ticket_params[:per_page])
    json_response(@tickets)
  end

  def show
    json_response(@ticket)
  end

  def create
    @ticket = Ticket.new({ title: ticket_params[:title],
                           description: ticket_params[:description],
                           user: @user,
                           due_date: DateTime.parse(ticket_params[:due_date]) })
    if @ticket.save
      json_response(@ticket, :created)
    else
      json_response('Something went wrong', :internal_server_error)
    end
  end

  def update
    @ticket.update(ticket_params)
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
      :due_date,
      :page,
      :per_page
    )
  end

  def set_ticket
    @ticket = Ticket.find(ticket_params[:id])
  end

  def set_user
    @user = User.find(ticket_params[:user_id])
  end
end
