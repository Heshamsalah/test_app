# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create user' do
    user = create(:user)

    assert user
  end
end
