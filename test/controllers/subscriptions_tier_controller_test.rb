# frozen_string_literal: true

require 'test_helper'

class SubscriptionsTierControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get subscriptions_tier_index_url
    assert_response :success
  end
end
