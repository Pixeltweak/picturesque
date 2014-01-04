class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :show

  impressionist actions: [:show], unique: [:session_hash]

  def index
    authorize! :index, @user, message: 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @tile_thumbnails = true
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user, message: 'Not authorized as an administrator.'
    @user = User.find(user_params[:id])
    if @user.update(user_params, as: :admin)
      redirect_to edit_user_path(@user), notice: "User updated."
    else
      redirect_to edit_user_path(@user), alert: "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, @user, message: 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, notice: "User deleted."
    else
      redirect_to users_path, notice: "Can't delete yourself."
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)

    redirect_to @user, notice: "You are now following #{@user.name}"
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)

    redirect_to @user, notice: "You are not following #{@user.name} any longer"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :current_password, :avatar)
  end
end