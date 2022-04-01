# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user_point do
    point_earned { Faker::Number.number(digits: 4) }
    user
  end
end
