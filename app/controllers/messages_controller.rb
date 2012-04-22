class MessagesController < InheritedResources::Base
  
  
  def index
    index! {
      @friends_messages = current_user.friends.messages
      @friends_messages = @friends_messages.tagged_with(params[:tag]) if params[:tag].present?
    }
  end
  
  
  def begin_of_association_chain
    current_user
  end
  
end
