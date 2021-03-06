class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def edit
    @user = User.find(params[:id])
  end

  def show
    user = User.find(params[:id])
    @name = user.name
    @tweets = user.tweets
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

end

private

  def user_params
    params.require(:user).permit(:name, :email)
  end