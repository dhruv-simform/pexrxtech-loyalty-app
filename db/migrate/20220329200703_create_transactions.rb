# frozen_string_literal: true

# migration to create the transaction
class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :amount

      t.timestamps
    end
  end
end
