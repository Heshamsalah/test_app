# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @users = create_list(:user, 20)
  end

  test 'should get paginated users' do
    get users_url, params: { page: 1, per_page: 50 }
    assert_response :success
    assert_equal @users.first.name,
                    JSON.parse(@response.body).first['name']
  end

  test 'should get user by id' do
    user = @users.first
    get user_url(id: user.id)
    assert_response :success
    assert_equal user.id, JSON.parse(@response.body)['id']
  end

  test 'should create user' do
    user_params = attributes_for(:user)
    post users_url, params: user_params
    assert_response :success
  end

  test 'should update user' do
    user = @users.first
    put user_url(id: user.id), params: { name: 'New name' }
    assert_response :success
    assert_equal user.reload.name, 'New name'
  end

  test 'should delete user' do
    delete user_url(id: @users.first.id)
    assert_response :success
    assert_equal @users.count - 1, User.count
  end
end
