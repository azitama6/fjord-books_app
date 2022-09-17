# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :following_relationships, class_name: 'UserRelationship', foreign_key: 'user_id', dependent: :destroy, inverse_of: 'followings'
  has_many :follower_relationships, class_name: 'UserRelationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: 'followers'
  has_many :followings, through: :following_relationships, source: :follow
  has_many :followers, through: :follower_relationships, source: :user

  def follow(user_id)
    following_relationships.create(follow_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(follow_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
