class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new
  end


  private
  def create_params
    params.require(:tweet).permit(:content, :image)
  end
end
