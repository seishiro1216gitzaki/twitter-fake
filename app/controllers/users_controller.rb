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

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
