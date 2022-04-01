# frozen_string_literal: true

# migration to generate the create userpoints
class CreateUserPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :user_points do |t|
      t.integer :point_earned
      t.string :location

      t.timestamps
    end
  end
end
