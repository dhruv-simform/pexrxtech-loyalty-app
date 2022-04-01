# frozen_string_literal: true

# migration to create the reward
class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
