class UsersController < ApplicationController
  def search
  end

  def tweets
    screen_name = user_params['screen_name']
    @user = TWITTER_CLIENT.user(screen_name)

    if @user.nil?
      @tweets = []
    else
      User.create(id: @user.id, name: @user.name, screen_name: @user.screen_name)
      @tweets = TWITTER_CLIENT.user_timeline(@user.id, count: 10)
    end

    if @tweets.any?
      @tweets.each do |tweet|
        t = Tweet.new(id: tweet.id, text: tweet.full_text, tweeted_at: tweet.created_at, user_id: tweet.user.id)
        t.save # Use save instead of save! so it won't save non-unique entries and also wont raise an error
      end
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.permit('screen_name')
  end
end
