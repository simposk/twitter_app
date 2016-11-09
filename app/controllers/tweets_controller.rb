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

  def upvote
    @tweet = Tweet.find(params[:id])
    @tweet.upvote_by current_user
    redirect_to root_path
  end

  def downvote
    @tweet = Tweet.find(params[:id])
    @tweet.downvote_by current_user
    redirect_to :back
  end


  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
