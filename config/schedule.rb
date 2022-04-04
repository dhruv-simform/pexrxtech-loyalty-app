# frozen_string_literal: true

set :environment, 'development'

every 1.day do
  rake 'reward_creator:user_has_collected_100_points', output: 'log/check_status_update.log', environment: 'development'
  rake 'reward_creator:user_spent_more_then_1000', output: 'log/check_status_update.log', environment: 'development'
  rake 'reward_creator:extra_cashback_to_user', output: 'log/check_status_update.log', environment: 'development'
  rake 'reward_creator:point_expired_every_year', output: 'log/check_status_update.log', environment: 'development'
end

every 1.month do
  rake 'reward_creator:birthday_rewards', output: 'log/check_status_update.log', environment: 'development'
end
