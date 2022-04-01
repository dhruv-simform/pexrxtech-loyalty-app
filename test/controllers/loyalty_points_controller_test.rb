# frozen_string_literal: true

require 'test_helper'

class LoyaltyPointsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get loyalty_points_index_url
    assert_response :success
  end
end
