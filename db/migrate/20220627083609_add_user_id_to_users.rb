# frozen_string_literal: true

def change
  add_column :users, :user_id, :string, null: false, default: ''
end
