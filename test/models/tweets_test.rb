require 'test_helper'

class TweetsTest < ActiveSupport::TestCase
  test "create tweet while setting primary key id" do
    tweet = Tweet.new(id: 1, text: "blah", tweeted_at: Time.now, user_id: 1)
    assert tweet.valid?
    assert tweet.save
  end

  test "tweet attributes presence validation" do
    tweet = Tweet.new
    refute tweet.valid?
    tweet.errors.messages.each do |key, msg|
      assert [:id, :text, :tweeted_at, :user_id].include?(key)
      assert_equal ["can't be blank"], msg
    end
  end

  test "tweet attributes uniqueness validation" do
    first_tweet = Tweet.new(id: 1, text: "blah", tweeted_at: Time.now, user_id: 1)
    assert first_tweet.valid?
    assert first_tweet.save

    second_tweet = Tweet.new(id: 1, text: "yolo", tweeted_at: Time.now, user_id: 2)
    refute second_tweet.valid?
    refute second_tweet.save
    assert_equal ["has already been taken"], second_tweet.errors.messages[:id]
  end
end
