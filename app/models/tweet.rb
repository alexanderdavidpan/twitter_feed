class Tweet < ActiveRecord::Base
  validates_presence_of :id, :text, :tweeted_at, :user_id
  validates_uniqueness_of :id
end
