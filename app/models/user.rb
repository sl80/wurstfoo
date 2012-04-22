class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  
  has_many :friendships
  has_many :friends, :through => :friendships, :class_name => 'User'
  has_many :messages
  
  def self.messages
    ::Message.where(:user_id => ids)
  end
  
  def self.ids
    select(:'users.id').map(&:id)
  end
  
  def befriend(user)
    return if friend_with?(user) || user == self
    friendships.create :friend => user
  end
  
  def unfriend(user)
    friendships.with_user(user).destroy_all
  end
  
  def friend_with?(user)
    friendships.with_user(user).any?
  end
  
  
end
