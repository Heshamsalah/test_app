require 'test_helper'

class RemindersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user, :reminders_on)
    @ticket = create(:ticket, user: @user)
    @reminders = create_list(:reminder, 20, ticket: @ticket)
  end

  test 'should get paginated reminders' do
    get user_ticket_reminders_url(user_id: @user.id, ticket_id: @ticket.id), 
      params: { page: 1, per_page: 50 }
    assert_response :success
    assert_equal @reminders.first.time,
                    DateTime.parse(JSON.parse(@response.body).first['time'])
  end

  test 'should get reminder by id' do
    reminder = @reminders.first
    get user_ticket_reminder_url(
      user_id: @user.id, ticket_id: @ticket.id, id: reminder.id
    )
    assert_response :success
    assert_equal reminder.id, JSON.parse(@response.body)['id']
  end

  test 'should create reminder' do
    reminder_params = attributes_for(:reminder)
    post user_ticket_reminders_url(user_id: @user.id, ticket_id: @ticket.id), 
      params: reminder_params
    assert_response :success
  end

  test 'should update reminder' do
    reminder = @reminders.first
    put user_ticket_reminder_url(
      user_id: @user.id, ticket_id: @ticket.id, id: reminder.id
    ), params: { status: 'Active' }
    assert_response :success
    assert_equal reminder.reload.status, 'Active'
  end

  test 'should delete reminder' do
    reminder = @reminders.first
    delete user_ticket_reminder_url(
      user_id: @user.id, ticket_id: @ticket.id, id: reminder.id
    )
    assert_response :success
    assert_equal @reminders.count - 1, Reminder.count
  end
end
