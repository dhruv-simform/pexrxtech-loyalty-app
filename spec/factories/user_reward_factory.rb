# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user_reward do
    reward_status { true }
    reward
    user
  end
end
