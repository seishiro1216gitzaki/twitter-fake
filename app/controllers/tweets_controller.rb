class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order("created_at DESC")
  end

  def create
    @tweet = Tweet.new(create_params)
    if @tweet.save
      redirect_to tweets_path, notice: "メッセージが送信されました"
    else
      flash.now[:alert] = "メッセージが入力されていません"
      render 'index'
    end
  end


  private
    def create_params
      params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
    end
end
