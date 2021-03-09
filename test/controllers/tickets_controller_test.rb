# frozen_string_literal: true

require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @tickets = create_list(:ticket, 20)
  end

  test 'should get paginated tickets' do
    get tickets_url, params: { page: 1, per_page: 50 }
    assert_response :success
    assert_includes @tickets.first.title,
                    JSON.parse(@response.body).first['title']
  end

  test 'should get ticket by id' do
    ticket = @tickets.first
    get ticket_url(id: ticket.id)
    assert_response :success
    assert_equal ticket.id, JSON.parse(@response.body)['id']
  end

  test 'should create ticket' do
    ticket_params = attributes_for(:ticket, :with_due_date)
    post tickets_url, params: ticket_params
    assert_response :success
  end

  test 'should update ticket' do
    ticket = @tickets.first
    put ticket_url(id: ticket.id), params: { title: 'New updated title' }
    assert_response :success
    assert_equal ticket.reload.title, 'New updated title'
  end

  test 'should delete ticket' do
    delete ticket_url(id: @tickets.first.id)
    assert_response :success
    assert_equal @tickets.count - 1, Ticket.count
  end
end
