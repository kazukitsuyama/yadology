class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @name = current_user.name
    @tweets = current_user.tweets
  end
end
