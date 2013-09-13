module ApplicationHelper
  def logged_in?
     !session[:servant].nil?
   end
end
