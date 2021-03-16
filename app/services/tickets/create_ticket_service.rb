class CreateTicketService < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    ticket = Ticket.create!({ title: @params[:title],
      description: @params[:description],
      created_by: GetUserService.call(@params[:user_id]).data.id,
      due_date: DateTime.parse(@params[:due_date]) })
    result(true, ticket)
  rescue => e
    # logger.error(e)
    result(false, e)
  end
end