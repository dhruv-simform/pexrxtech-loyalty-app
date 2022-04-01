# frozen_string_literal: true

# UserReward class to handle the reward for the user.
class UserReward < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :reward
end
