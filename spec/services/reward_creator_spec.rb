# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RewardCreator, type: :model do
  context 'rewards' do
    let!(:coffee_reward) { create(:reward, name: 'Free Coffee') }
    let!(:movie_reward) { create(:reward, name: 'Free Movie ticket') }
    let!(:airport_lounge_reward) { create(:reward, name: 'Airport Lounge Access Reward') }
    let(:user) { create(:user) }
    let(:user_reward) { create(:user_reward, user: user) }
    let!(:transaction) { create(:transaction, :india, user: user) }

    it 'should not expire before end of year' do
      RewardCreator.new.point_expired_every_year
      expect(UserPoint.exists?(user.user_points.first.id)).to be true
    end

    it 'should expire previous year points' do
      user.user_points.first.update(created_at: Time.now - 1.year + 1.day)
      RewardCreator.new.point_expired_every_year
      expect(UserPoint.exists?(user.user_points.first)).to be false
    end

    it 'assigning free coffee reward if user point greater than 100' do
      user.user_points.update(point_earned: 110)
      RewardCreator.new.user_has_collected_100_points
      user.reload
      expect(user.rewards.find_by(name: 'Free Coffee').present?).to be true
    end

    it 'should not assign free coffee reward if user point less than 100' do
      user.user_points.update(point_earned: 90)
      RewardCreator.new.user_has_collected_100_points
      user.reload
      expect(user.rewards.find_by(name: 'Free Coffee').present?).to be false
    end

    it 'should not assign free coffee reward if user point greater than 1000' do
      user.user_points.update(point_earned: 1100)
      RewardCreator.new.user_spent_more_then_1000
      user.reload
      expect(user.rewards.find_by(name: 'Free Movie ticket').present?).to be true
    end

    it 'should not assign free coffee reward if user point less than 1000' do
      user.user_points.update(point_earned: 900)
      RewardCreator.new.user_spent_more_then_1000
      user.reload
      expect(user.rewards.find_by(name: 'Free Movie ticket').present?).to be false
    end

    it 'assigning free coffee reward if user birthday is current month' do
      user.update(birthday: DateTime.now)
      RewardCreator.new.user_birthday
      user.reload
      expect(user.rewards.find_by(name: 'Free Coffee').present?).to be true
    end

    it 'should not assign free coffee reward if user birthday is not current month' do
      user.update(birthday: DateTime.now - 2.month)
      RewardCreator.new.user_birthday
      user.reload
      expect(user.rewards.find_by(name: 'Free Coffee').present?).to be false
    end
  end
end
