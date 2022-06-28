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
    respond_to do |format|
      if @users.update(user_params)
        format.html { redirect_to @users, notice: t('controllers.common.notice_update', name: User.model_name.human) }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
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
