# frozen_string_literal: true

class AddUserIdIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :user_id, unique: true
  end
end
