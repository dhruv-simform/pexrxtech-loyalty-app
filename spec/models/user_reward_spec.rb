# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserReward, type: :model do
  context 'assign rewards' do
    let(:user_reward) { create(:user_reward) }
    let!(:coffee_reward) { create(:reward, name: 'Free Coffee') }
    let!(:movie_reward) { create(:reward, name: 'Free Movie ticket') }
    let!(:user_point) { create(:user_point, user: user_reward.user) }

    it 'assigning free coffee reward if user point greater than 100' do
      user_point.update(point_earned: 110)
      user_reward.assign_rewards
      user_reward.reload
      expect(user_reward.user.rewards.find_by(name: 'Free Coffee').present?).to be true
    end

    it 'should not assign free coffee reward if user point less than 100' do
      user_point.update(point_earned: 90)
      user_reward.assign_rewards
      user_reward.reload
      expect(user_reward.user.rewards.find_by(name: 'Free Coffee').present?).to be false
    end

    it 'should not assign free coffee reward if user point greater than 1000' do
      user_point.update(point_earned: 1100)
      user_reward.assign_rewards
      user_reward.reload
      expect(user_reward.user.rewards.find_by(name: 'Free Movie ticket').present?).to be true
    end

    it 'should not assign free coffee reward if user point less than 1000' do
      user_point.update(point_earned: 900)
      user_reward.assign_rewards
      user_reward.reload
      expect(user_reward.user.rewards.find_by(name: 'Free Movie ticket').present?).to be false
    end
  end
end
