# frozen_string_literal: true

# Service to create the rewards for the user.
class RewardCreator
  # Giving free coffee reward to user when points earned is greater than 100
  def user_has_collected_100_points
    User.all.each do |user|
      @points = UserPoint.in_a_month(user.id)
      @user_reward = create_user_reward(user.id, 'Free Coffee') if points_earned > 100
    end
  end

  # Providing free coffee reward to user on their birthday
  def user_birthday
    @user_reward = birthday_this_month(User.current_birthday_users) if User.current_birthday_users.present?
  end

  # Giving free movie ticket reward to user when points earned is greater than 1000
  def user_spent_more_then_1000
    User.all.each do |user|
      first_transaction_date = user.transactions.first&.transaction_date
      return unless first_transaction_date.present?

      @points = UserPoint.within_60_days_after_first_transaction(user.id, first_transaction_date,
                                                                 first_transaction_date + 59.days)
      @user_reward = create_user_reward(user.id, 'Free Movie ticket') if points_earned > 1000
    end
  end

  # Remove the earned points after a year
  def point_expired_every_year
    user_points = UserPoint.where(created_at: Time.now.beginning_of_year - 1.year..Time.now.end_of_year - 1.year)
    user_points.destroy_all if user_points.present?
  end

  # Giving extra cashback to user when transaction amount is greater than 100
  def extra_cashback_to_user
    User.all.each do |user|
      total_transactions = user.transactions.where('amount > 100 ').count
      @user_reward = create_user_reward(user.id, '5% Cash Rebate') if total_transactions > 10
    end
  end

  def birthday_this_month(users)
    users.each do |user|
      @user_reward = create_user_reward(user.id, 'Free Coffee')
    end
  end

  private

  # Calculating points earned by the user
  def points_earned
    @points_earned ||= @points.sum(:point_earned)
  end

  # Fetching rewards for the user by name
  def reward(reward_name)
    Reward.find_by(name: reward_name)
  end

  # Creating Rewards for the specific user by name
  def create_user_reward(user_id, reward_name)
    UserReward.find_or_create_by(user_id: user_id, reward: reward(reward_name), reward_status: true)
  end
end
