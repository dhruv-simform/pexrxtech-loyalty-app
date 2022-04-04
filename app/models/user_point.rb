# frozen_string_literal: true

# UserPoint class to generate the user points
class UserPoint < ApplicationRecord
  # Soft delete to remove the user points
  acts_as_paranoid

  # Associations
  belongs_to :user, optional: true

  scope :in_a_month, lambda { |user_id|
    where(created_at: Time.now.beginning_of_month..Time.now.end_of_month, user_id: user_id)
  }
  scope :within_60_days_after_first_transaction, lambda { |user_id, first_date, last_date|
    where(created_at: first_date..last_date, user_id: user_id)
  }
end
