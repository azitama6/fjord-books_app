# frozen_string_literal: true

class ChangeClomnsNotnullAddUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :user_relationships, :user_id, :integer, null: false
    change_column :user_relationships, :follow_id, :integer, null: false
  end
end
