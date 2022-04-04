# frozen_string_literal: true

# User Transaction to generate the loyalty points and update the loyalty tier
class Transaction < ApplicationRecord
  # Associations
  belongs_to :user

  # added geocoded to get the latitude and longitude
  geocoded_by latitude: :latitude, longitude: :longitude

  # Validation
  validates_presence_of :amount, :user_id, :latitude, :longitude

  DEFAULT_COUNTRY = 'India'

  after_create :generate_points, :update_customer_loyalty_tier

  def generate_points
    earned_points = calculate_earned_points[0]
    response = calculate_earned_points[1]

    UserPoint.create(
      point_earned: earned_points,
      location: response.data['address']['country'],
      user_id: user_id
    )
  end

  # Generate point based on the location
  def calculate_earned_points
    latitude_longitude = "#{latitude},#{longitude}"
    response = Geocoder.search(latitude_longitude).first
    if response.data['error'].present?
      errors.add(:base, response.data['error'])
    elsif self.amount.to_i >= 100
      amount = self.amount / 10
      earned_amount = (amount / 10).round * 10
      earned_amount *= 2 unless response.data['address']['country'] == DEFAULT_COUNTRY
    end
    [earned_amount, response]
  end

  # Update customer loyalty tier based on the earning points
  def update_customer_loyalty_tier
    total_earned_point = user.user_points.sum(:point_earned)
    if total_earned_point > 1000 && total_earned_point < 5000
      reward = Reward.find_by(name: 'Airport Lounge Access Reward')
      user.user_rewards.create(reward_id: reward.id)
      user.update!(loyalty_tier: 1)
    elsif total_earned_point > 5000
      user.update!(loyalty_tier: 2)
    end
  end
end
