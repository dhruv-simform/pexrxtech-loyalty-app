# frozen_string_literal: true

# UserPoint class to generate the user points
class UserPoint < ApplicationRecord
  # Soft delete to remove the user points
  acts_as_paranoid

  # Associations
  belongs_to :user, optional: true

  # Validations
  
end
