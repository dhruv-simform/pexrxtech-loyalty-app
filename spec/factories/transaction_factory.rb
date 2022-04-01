# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :transaction do
    amount { Faker::Number.number(digits: 3) }
    user
  end

  trait :india do
    latitude { 21.295132 }
    longitude { 81.828232 }
  end

  trait :united_states do
    latitude { 37.773972 }
    longitude { -122.431297 }
  end
end
