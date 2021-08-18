class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_q, only: [:index, :search]
  def index
    @tweets = Tweet.page(params[:page])
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
    @like = Like.new
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

  def search
    @results = @q.result
    @tweets = Tweet.page(params[:page])
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
    user.name = "ゲスト"
    user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
    sign_in user
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:yado_title, :yado_name, :text, :date, :price, :area_id, images: []).merge(user_id: current_user.id)
  end

  def set_q
    @q = Tweet.ransack(params[:q])
  end
end
