class GetUserService < ApplicationService
  def initialize(user_id)
    @user_id = user_id
  end
  
  def call
    user = User.find(@user_id)
    result(true, user)
  rescue StandardError => e
    # logger.error(e)
    result(false, e)
  end
end