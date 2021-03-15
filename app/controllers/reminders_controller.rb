# frozen_string_literal: true

class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[show update destroy]
  before_action :set_resource, only: %i[create]

  def index
    @reminders = Reminder.where(reminderable_id: reminder_params[:resource_id])
                         .page(reminder_params[:page])
                         .per(reminder_params[:per_page])
    json_response(@reminders)
  end

  def show
    json_response(@reminder)
  end

  def create
    @reminder = Reminder.new(
      reminder_filtered_params.merge(reminderable: @resource)
    )

    if @reminder.save
      json_response(@reminder, :created)
    else
      json_response('Something went wrong', :internal_server_error)
    end
  end

  def update
    @reminder.update(reminder_filtered_params)
    head :no_content
  end

  def destroy
    @reminder.destroy
    head :no_content
  end

  private

  def reminder_params
    params.permit(
      :id,
      :title,
      :note,
      :due_date,
      :remind_interval,
      :resource_id,
      :resource_type,
      :page, :per_page
    )
  end

  def reminder_filtered_params
    reminder_params.except(:id, :page, :resource_id, :resource_type, :per_page)
  end

  def set_reminder
    @reminder = Reminder.find(reminder_params[:id])
  end

  def set_resource
    reminder_id = reminder_params[:resource_id]
    @resource = reminder_params[:resource_type].constantize.find(reminder_id)
  end
end
