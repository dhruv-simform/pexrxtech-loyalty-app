# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :reward do
    name { Faker::Name.first_name }
    description { Faker::Restaurant.description }
  end
end
