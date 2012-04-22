class UsersController < InheritedResources::Base
  
  def index
    return redirect_to new_user_session_path unless current_user
    index!
  end
  
  
  def befriend
    current_user.befriend(User.find(params[:user_id]))
    redirect_to :back
  end
  
  def unfriend
    current_user.unfriend(User.find(params[:user_id]))
    redirect_to :back
  end
  
end
