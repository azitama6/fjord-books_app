# frozen_string_literal: true

class UserRelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    redirect_to user_url, notice: 'フォローしました'
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to user_url, notice: 'フォロー解除しました'
  end
end
