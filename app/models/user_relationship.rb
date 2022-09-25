# frozen_string_literal: true

class UserRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'
end
