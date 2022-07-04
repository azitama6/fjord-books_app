# frozen_string_literal: true

class AddUserIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_id, :string, null: false, default: ''
  end
end