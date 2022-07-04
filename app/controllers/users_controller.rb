# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :ensure_user, only: %i[edit update]

  def index
    @users = User.page(params[:page])
  end

  def show; end

  def edit; end

  def update
    if @users.update(user_params)
      redirect_to @users, notice: t('controllers.common.notice_update', name: User.model_name.human)
    else
      render :edit
    end
  end

  private

  def set_user
    @users = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :post_code, :address, :comment)
  end

  def ensure_user
    @posts = current_user.user_id
    @post = @posts.find_by(id: params[:id])
    redirect_to new_post_path unless @post
  end
end
