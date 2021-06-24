class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @post_images = PostImage.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "プロフィール情報を変更しました"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :prefecture, :history, :introduction)
  end
end
