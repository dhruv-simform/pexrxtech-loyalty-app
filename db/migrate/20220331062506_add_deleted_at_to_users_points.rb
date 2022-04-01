# frozen_string_literal: true

# added deletedat for the soft delete
class AddDeletedAtToUsersPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :user_points, :deleted_at, :datetime
    add_index :user_points, :deleted_at
  end
end
