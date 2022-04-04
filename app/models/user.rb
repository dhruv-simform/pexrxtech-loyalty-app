# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :transactions, dependent: :destroy
  has_many :user_points, dependent: :destroy
  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards

  enum loyalty_tier: { standard: 0, gold: 1, platinum: 2 }

  scope :current_birthday_users, -> { where('extract(month from birthday) = ?', Date.today.month) }
end
