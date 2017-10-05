class UsersController < ApplicationController
  def index
    @user = User.all
    @tweets = Tweet.order("created_at DESC")
    @CurrentUserTweets = current_user.tweets.order("created_at DESC")
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
    params.require(:user).permit(:name, :email)
  end
end
