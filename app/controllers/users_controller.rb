class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

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
    params.require(:user).permit(:name, :email, :address, :comment)
  end
end
