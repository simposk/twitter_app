class TweetsController < ApplicationController

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: "You've just tweeted."
    else
      render "new"
    end
  end

  def destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
