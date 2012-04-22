class Tag < ActiveRecord::Base
  attr_accessible :name
  belongs_to :message
end
