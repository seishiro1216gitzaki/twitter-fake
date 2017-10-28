class WatchLatersController < ApplicationController
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
