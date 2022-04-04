# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'generating user points' do
    let(:transaction) { create(:transaction, :india) }

    it 'based on location for india' do
      expect(transaction.user.user_points.first.point_earned).to eq((transaction.amount / 100).round * 10)
    end
  end

  context 'generating 2X user points' do
    let(:transaction) { create(:transaction, :united_states) }
    it 'based on location for united states' do
      expect(transaction.user.user_points.first.point_earned).to eq(2 * (transaction.amount / 100).round * 10)
    end
  end

  context 'update customer loyalty tier' do
    let(:transaction) { create(:transaction, :united_states) }
    let!(:airport_lounge_reward) { create(:reward, name: 'Airport Lounge Access Reward') }

    it 'default tier should be standard' do
      transaction.update_customer_loyalty_tier
      expect(transaction.user.loyalty_tier).to eq(0)
    end

    it 'should be updated to gold tier' do
      transaction.user.user_points.first.update(point_earned: 1100)
      transaction.update_customer_loyalty_tier
      expect(transaction.user.loyalty_tier).to eq(1)
    end

    it 'should be updated to platinum tier' do
      transaction.user.user_points.first.update(point_earned: 5100)
      transaction.update_customer_loyalty_tier
      expect(transaction.user.loyalty_tier).to eq(2)
    end
  end
end
