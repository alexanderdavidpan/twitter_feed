class User < ActiveRecord::Base
  validates_presence_of :id, :name, :screen_name
  validates_uniqueness_of :id, :screen_name, :case_sensitive => false

  has_many :tweets

  self.primary_key = "id"

  def self.find_or_create_by_screen_name(screen_name)
    user = find_by_screen_name(screen_name)
    if user.nil?
      twitter_user = TWITTER_CLIENT.user(screen_name)
      if twitter_user
        user = User.create(id: twitter_user.id, name: twitter_user.name, screen_name: twitter_user.screen_name)
      else
        user = nil
      end
    end
    user
  end
end
