# frozen_string_literal: true

require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user, :reminders_on)
    @tickets = create_list(:ticket, 20, user: @user)
  end

  test 'should get paginated tickets' do
    get user_tickets_url(user_id: @user.id),
        params: { page: 1, per_page: 50 }
    assert_response :success
    assert_equal @tickets.first.title,
                 JSON.parse(@response.body).first['title']
  end

  test 'should get ticket by id' do
    ticket = @tickets.first
    get user_ticket_url(user_id: @user.id, id: ticket.id)
    assert_response :success
    assert_equal ticket.id, JSON.parse(@response.body)['id']
  end

  test 'should create ticket' do
    ticket_params = attributes_for(:ticket, :with_due_date)
    post user_tickets_url(user_id: @user.id), params: ticket_params
    assert_response :success
  end

  test 'should update ticket' do
    ticket = @tickets.first
    put user_ticket_url(user_id: @user.id, id: ticket.id),
        params: { title: 'New updated title' }
    assert_response :success
    assert_equal ticket.reload.title, 'New updated title'
  end

  test 'should delete ticket' do
    ticket = @tickets.first
    delete user_ticket_url(user_id: @user.id, id: ticket.id)
    assert_response :success
    assert_equal @tickets.count - 1, Ticket.count
  end
end
