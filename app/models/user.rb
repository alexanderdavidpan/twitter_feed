class User < ActiveRecord::Base
  validates_presence_of :id, :name, :screen_name
  validates_uniqueness_of :id, :screen_name

  has_many :tweets

  self.primary_key = "id"
end
