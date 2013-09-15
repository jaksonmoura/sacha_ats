module ApplicationHelper
  def logged_in?
     !session[:servant].nil?
  end

  def admin?
    if logged_in?
      technical = Technical.find(session[:technical_id])
      technical.admin
    end
  end
end
