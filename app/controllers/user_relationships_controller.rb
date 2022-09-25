# frozen_string_literal: true

class UserRelationshipsController < ApplicationController
  def follow
    if current_user.follow(params[:id])
      redirect_to user_url, notice: 'フォローしました'
    else
      redirect_to user_url, notice: '既にフォローされています'
    end
  end

  def unfollow
    if current_user.unfollow(params[:id])
      redirect_to user_url, notice: 'フォロー解除しました'
    else
      redirect_to user_url, notice: '既にフォロー解除されています'
    end
  end
end
