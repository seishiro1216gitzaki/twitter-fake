class UsersController < ApplicationController
  def index
    @user = User.all
    @tweets = Tweet.order("created_at DESC")
    @CurrentUserTweets = current_user.tweets.order("created_at DESC")
    @users = User.where.not(id: current_user.id).order("RAND()").limit(4)
    @watch_laters = current_user.watch_laters.select("tweet_id")
    @watch_laters_tweets = Tweet.where(id: @watch_laters)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @usertweets = @user.tweets.order("created_at DESC")
    @users = User.where.not(id: current_user.id).order("RAND()").limit(4)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

   def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
