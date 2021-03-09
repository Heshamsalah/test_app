# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.page(user_params[:page]).per(user_params[:per_page])
    json_response(@users)
  end

  def show
    json_response(@user)
  end

  def create
    @user = User.new(user_params.except(:id, :page, :per_page))

    if @user.save
      json_response(@user, :created)
    else
      json_response('Something went wrong', :internal_server_error)
    end
  end

  def update; end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(
      :id,
      :name,
      :mail,
      :send_due_date_reminder,
      :due_date_reminder_interval,
      :due_date_reminder_time,
      :time_zone,
      :page, :per_page
    )
  end

  def set_user
    @user = User.find(user_params[:id])
  end
end
