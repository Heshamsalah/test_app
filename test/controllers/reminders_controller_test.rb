require 'test_helper'

class RemindersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @reminders = create_list(:reminder, 20)
    @resource = @reminders.first.reminderable
  end

  test 'should_get_paginated_reminders_for_a_resource' do
    get reminders_url,
      params: { resource_id: @resource.id, page: 1, per_page: 50 }
    assert_response :success
    reminders_count = Reminder.where(reminderable: @resource).count
    assert_equal JSON.parse(@response.body).count, reminders_count
  end

  test 'should get reminder by id' do
    reminder = @reminders.first
    get reminder_url(id: reminder.id)
    assert_response :success
    assert_equal reminder.id, JSON.parse(@response.body)['id']
  end

  test 'should create reminder' do
    reminder_params = attributes_for(:reminder).merge(
      resource_id: @resource.id, resource_type: @resource.class.name
    )
    post reminders_url, 
      params: reminder_params
    assert_response :success
  end

  test 'should update reminder' do
    reminder = @reminders.first
    put reminder_url(id: reminder.id), params: { note: 'New Note' }
    assert_response :success
    assert_equal reminder.reload.note, 'New Note'
  end

  test 'should delete reminder' do
    reminder = @reminders.first
    delete reminder_url(id: reminder.id)
    assert_response :success
    assert_equal @reminders.count - 1, Reminder.count
  end
end
