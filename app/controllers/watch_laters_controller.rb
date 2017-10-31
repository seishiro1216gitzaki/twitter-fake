class WatchLatersController < ApplicationController
  def index
    @user = User.all
    @watch_laters = current_user.watch_laters.select("tweet_id")
    @watch_laters_tweets = Tweet.where(id: @watch_laters)
    @users = User.where.not(id: current_user.id).order("RAND()").limit(4)
  end
  def create
    @user_id = current_user.id
    @tweet_id = Tweet.find(params[:tweet_id]).id
    @watch_later = WatchLater.new(tweet_id: @tweet_id, user_id: @user_id)
    if @watch_later.save
         redirect_to root_path
    end
  end

  def destroy
    @watch_later = WatchLater.find(params[:id])
    if @watch_later.destroy
         redirect_to root_path
    end
  end

end
