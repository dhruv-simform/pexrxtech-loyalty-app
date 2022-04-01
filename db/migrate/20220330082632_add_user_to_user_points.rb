# frozen_string_literal: true

# add user to userpoints
class AddUserToUserPoints < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_points, :user, null: false, foreign_key: true
  end
end
