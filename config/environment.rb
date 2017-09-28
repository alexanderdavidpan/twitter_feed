# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
TwitterFeed::Application.initialize!

# Require twitter lib
require 'twitter'

# Setup Twitter Client credentials
env_config = YAML::load_file(File.join(__dir__, 'twitter.yml'))

env_config.each do |key, value|
  ENV[key] = value
end

TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end
