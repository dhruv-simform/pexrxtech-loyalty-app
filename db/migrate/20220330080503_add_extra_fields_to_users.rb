# frozen_string_literal: true

# Adding extra column in the devise default table
class AddExtraFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :datetime
  end
end
