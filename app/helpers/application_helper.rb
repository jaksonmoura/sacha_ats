module ApplicationHelper
  # Return true if the a user is logged
  def logged_in?
     !session[:servant].nil?
  end


  # Return true if the current user is admin
  def admin?
    if logged_in?
      technical = Technical.find(session[:technical_id])
      technical.admin
    end
  end
end
