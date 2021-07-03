class TweetsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image).merge(user_id: current_user.id)
  end
end
