class GetTicketsService < ApplicationService
  def initialize(params)
    @params = params
  end
  
  def call
    tickets = Ticket.where(user: @params[:user_id])
      .page(@params[:page]).per(@params[:per_page])
    result(true, tickets)
  rescue StandardError => e
    # logger.error(e)
    result(false, e)
  end
end