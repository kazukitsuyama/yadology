class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def edit
    @user = User.find(params[:id])
  end

  def show
    @name = current_user.name
    @tweets = current_user.tweets
  end
end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image )
  end