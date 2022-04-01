# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.in_date_period }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
