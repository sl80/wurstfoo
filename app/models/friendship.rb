class Friendship < ActiveRecord::Base
  attr_accessible :title, :body, :friend
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  
  def self.with_user(user)
    where(:friend_id => user.id)
  end
  
end
