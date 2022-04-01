# frozen_string_literal: true

class Reward < ApplicationRecord
  # Associations
  has_many :user_rewards, dependent: :destroy
  has_many :users, through: :user_rewards

  # validations
  validates_presence_of :name, :description
end
