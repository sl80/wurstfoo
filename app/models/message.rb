class Message < ActiveRecord::Base
  attr_accessible :title, :text, :user, :tags
  belongs_to :user
  has_many :tags
  
  
  def tag_names
    tags.map(&:name).join(',')
  end
  
  def tag_names=(names)
    names.split(',').each do |name|
      tags.create(:name => name)
    end
  end
  
  def self.tagged_with(tag)
    joins(:tags).where('tags.name = ?', tag)
  end
  
  
  def self.tags
    ::Tag.where(:message_id => ids)
  end
  
  def self.ids
    select(:'messages.id').map(&:id)
  end
  
  
  
end
