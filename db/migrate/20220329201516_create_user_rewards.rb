# frozen_string_literal: true

# migration to create the user rewards middle table
class CreateUserRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rewards do |t|
      t.bigint :user_id
      t.bigint :reward_id
      t.boolean :reward_status

      t.timestamps
    end
  end
end
