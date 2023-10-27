class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update]

  def show
    @likes_workspaces = current_user.likes.map(&:workspace)
    @reviewed_workspaces = current_user.reviews.map(&:workspace)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'ユーザー情報が更新されました'
    else
      flash.now[:danger] = 'ユーザー情報を更新できませんでした'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :address, :latitude, :longitude)
  end
end
