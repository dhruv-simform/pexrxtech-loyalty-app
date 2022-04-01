# frozen_string_literal: true

namespace :reward_creator do
  desc 'Generate the rewards for the user'
  task user_has_collected_100_points: :environment do
    reward_creator = RewardCreator.new
    reward_creator.user_has_collected_100_points
  end

  task user_spent_more_then_1000: :environment do
    reward_creator = RewardCreator.new
    reward_creator.user_spent_more_then_1000
  end

  task extra_cashback_to_user: :environment do
    reward_creator = RewardCreator.new
    reward_creator.extra_cashback_to_user
  end

  task birthday_rewards: :environment do
    reward_creator = RewardCreator.new
    reward_creator.user_birthday
  end

  task point_expired_every_year: :environment do
    reward_creator = RewardCreator.new
    reward_creator.point_expired_every_year
  end
end
