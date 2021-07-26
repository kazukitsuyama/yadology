class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @tweets = Tweet.order("created_at DESC")
  end

  def new
    @tweet = Tweet.new

  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    redirect_to root_path unless current_user.id == @tweet.user_id
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path
   else
     render :edit
   end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to root_path
    else
      redirect_to edit_tweet_path
    end
    redirect_to root_path unless current_user == tweet.user
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :yado_title, :yado_name, :text, :date, :price, :area_id).merge(user_id: current_user.id)
  end
end
